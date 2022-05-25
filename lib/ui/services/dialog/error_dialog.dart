

part of dialog_service;

class _ErrorDialog extends StatefulWidget {

  String header;
  String label;
  Object exception;

  _ErrorDialog({
    Key? key,
    this.header = "Fehler aufgetreten",
    this.label = "Leider ist etwas schief gegangen",
    required this.exception,

  }) : super(key: key);

  @override
  _ErrorDialogState createState() => _ErrorDialogState();
}


class _ErrorDialogState extends State<_ErrorDialog> {

  bool _showDetails = false;

  @override
  void initState() {
    super.initState();
  }

  void _switchShowDetails(){
    setState(() {
      _showDetails = !_showDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: SizedBox(
        width: 128 * 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 128,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.cancel_outlined,size: 48,),
                  const SizedBox(height: 4,),
                  Text(widget.header,style: Theme.of(context).textTheme.headline3,)
                ],
              ),
            ),
            Container(
              height: 1,
              color: const Color.fromRGBO(170, 170, 170, 1.0),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
              color: Color.fromRGBO(240, 240, 240, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )
              ),
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child:   Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.label),

                    if(_showDetails) Container(height: 8,),

                    if(_showDetails)
                      Container(
                        height: 200,
                        child: SingleChildScrollView(
                          child: Text(widget.exception.toString(),style: TextStyle(fontSize: 12),),
                        ),
                      ),

                    Container(height: 8,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextButton(onPressed: _switchShowDetails, child: Text(
                            _showDetails? "Weniger" : " Mehr "
                        )),
                        Container(width: 8,),

                        ElevatedButton(onPressed: ()=>pop(context), child: Text("Schließen"))
                      ],
                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

}
