import 'package:flutter/foundation.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  final String broker = 'broker.hivemq.com';
  final int port = 1883;
  final String clientIdentifier = 'flutter_client_${DateTime.now().millisecondsSinceEpoch}'; // Unique client ID
  final String id = 'VS/1234567890AB/';

  final ValueNotifier<String> relayNotifier = ValueNotifier<String>('Waiting for relay messages...');
  final ValueNotifier<String> energyNotifier = ValueNotifier<String>('Waiting for energy messages...');
  final ValueNotifier<String> statusNotifier = ValueNotifier<String>('Waiting for energy messages...');


  late MqttServerClient client;

  MqttService() {
    client = MqttServerClient(broker, clientIdentifier);
    client.logging(on: true);
    client.port = port;
    client.keepAlivePeriod = 20;
    client.onDisconnected = onDisconnected;
    client.logging(on: true);
    client.setProtocolV311();


    final connMessage = MqttConnectMessage()
        .withClientIdentifier(clientIdentifier)
        .startClean()
        .withWillQos(MqttQos.atMostOnce);
    client.connectionMessage = connMessage;
  }
  Future<void> connect() async {
    try {
      await client.connect();
      if (client.connectionStatus!.state == MqttConnectionState.connected) {
        print('MQTT client connected');
        subscribe('${id}relay/get');
        subscribe('${id}energy/get');
        subscribe('${id}status/get');
      } else {
        print(
            'ERROR: MQTT client connection failed - disconnecting, state is ${client.connectionStatus!.state}');
        disconnect();
      }
    } catch (e) {
      print('Exception: $e');
      disconnect();
    }
  }

  void onDisconnected() {
    print('MQTT client disconnected');
  }

  void disconnect() {
    client.disconnect();
  }

  void subscribe(String topic) {
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('Subscribing to the topic: $topic');
      client.subscribe(topic, MqttQos.atMostOnce);
      client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
        final String message = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        print('Received message: $message from topic: ${c[0].topic}>');

        if (c[0].topic == '${id}relay/get') {
          relayNotifier.value = message;
        }
         if (c[0].topic == '${id}energy/get') {
          energyNotifier.value = message;
        }if (c[0].topic == '${id}status/get') {
          statusNotifier.value = message;
        }
      });
    }
  }

  void publish(String topic, String message) {
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      final builder = MqttClientPayloadBuilder();
      builder.addString(message);
      client.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
      print('Published message: $message to topic: $topic');
    } else {
      print('ERROR: MQTT client is not connected, cannot publish message');
    }
  }
}
