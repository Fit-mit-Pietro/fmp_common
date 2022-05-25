

part of dialog_service;

class _InfoDialog extends StatelessWidget {

  String header;
  String label;

  _InfoDialog({
    Key? key,
    required this.header,
    required this.label,

  }) : super(key: key);

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
                  const Icon(Icons.info_outline,size: 48,),
                  const SizedBox(height: 4,),
                  Text(header,style: Theme.of(context).textTheme.headline3,)
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
                    Text(label),


                    Container(height: 8,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [

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
