## BloC

-A complex model have

1.  As usual:
    1.1 a POJO class (the model itself)
    1.2 a service
    Talk to the Api,
    Deal with response from server side, like decode json...
    Can be inside the Model class as its functions

2.  MVVM Pattern/Reactive Programming in flutter:
    a BloC (Biz Logic component)
    It's like MVVM pattern
    ViewModel((BloC)) - Model
    View - ViewModel

        StreamController will Listen to the view as a stream
        Triger the service to get the formatted data
        Handle the biz logic with the data stream
        Pass to the View Obj - Stream
