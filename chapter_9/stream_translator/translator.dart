import 'dart:async';

class BeepBoopTranslator<S, T> extends StreamTransformerBase<S, T> {
  final StreamTransformer<S, T> transformer;

  BeepBoopTranslator() : transformer = createTranslator();

  @override
  Stream<T> bind(Stream<S> stream) => transformer.bind(stream);

  static StreamTransformer<S, T> createTranslator<S, T>() =>
      new StreamTransformer<S, T>((Stream inputStream, bool cancelOnError) {
        StreamController controller;
        StreamSubscription subscription;

        controller = new StreamController<T>(
          onListen: () {
            subscription = inputStream.listen((data) => controller.add(binaryNum(data)),
                onDone: controller.close,
                onError: controller.addError,
                cancelOnError: cancelOnError);
          },
          onPause: ([Future<dynamic> resumeSignal]) => subscription.pause(resumeSignal),
          onResume: () => subscription.resume(),
          onCancel: () => subscription.cancel(),
        );

        return controller.stream.listen(null);
      });

  static int binaryNum(int tenBased) {
    var binary = "";
    // Size of an integer is assumed to be 32 bits
    for (int i = 31; i >= 0; i--) {
      int k = tenBased >> i;
      if ((k & 1) > 0)
        binary += "1";
      else
        binary += "0";
    }

    return int.parse(binary);
  }
}
