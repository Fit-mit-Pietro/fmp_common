

part of dialog_service;

class _DeleteDialog extends StatefulWidget {

  String header;
  String label;
  Future<bool> Function() deleteOperation;

  _DeleteDialog({
    Key? key,
    required this.header,
    required this.label,
    required this.deleteOperation,

  }) : super(key: key);

  @override
  _DeleteDialogState createState() => _DeleteDialogState();
}

enum _DeleteState {
  askForConfirmation,
  deleting,
  deletingSuccessful,
  deletingFailed
}

class _DeleteDialogState extends State<_DeleteDialog> {


  _DeleteState _currentDeleteState = _DeleteState.askForConfirmation;

  @override
  void initState() {
    super.initState();
  }

  void _onDeletePressed() async{
    setState(() {
      _currentDeleteState = _DeleteState.deleting;
    });
    bool successful = await widget.deleteOperation();
    setState(() {
      _currentDeleteState = successful?
        _DeleteState.deletingSuccessful:
        _DeleteState.deletingFailed;
    });
    await Future.delayed(const Duration(milliseconds: 1200));
    pop(context,data: successful);
  }

  void _onDeleteTest() async {
    for(_DeleteState state in _DeleteState.values){
      setState(() {
        _currentDeleteState = state;
      });
      await Future.delayed(Duration(milliseconds: 1200));
    }
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
                  const Icon(Icons.delete_outline,size: 48,),
                  const SizedBox(height: 4,),
                  Text(widget.header,style: Theme.of(context).textTheme.headline3,)
                ],
              ),
            ),
            Container(
              height: 1,
              color: const Color.fromRGBO(170, 170, 170, 1.0),
            ),
            _buildBody(context),
          ],
        ),
      ),
    );
  }

  Container _buildBody(BuildContext context) {
    Widget child;

    switch(_currentDeleteState){

      case _DeleteState.askForConfirmation:
        child = _buildConfirmDelete(context);
        break;
      case _DeleteState.deleting:
        child = _buildDeleting(context);
        break;
      case _DeleteState.deletingSuccessful:
        child = _buildSuccessful(context);
        break;
      case _DeleteState.deletingFailed:
        child = _buildFailed(context);
        break;
    }

    return Container(
      height: 160,
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
        child: child,
      ),
    );
  }

  Widget _buildDeleting(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
         SizedBox(
          width: 48,
          height: 48,
          child: CircularProgressIndicator()
        ),
        SizedBox(height: 4,),
        Text("Wid gelöscht ... ")
      ],
    );
  }

  Widget _buildSuccessful(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
            width: 48,
            height: 48,
            child: Icon(
              Icons.check_circle_outline,
              size: 48,
              color: Colors.black45,
            )
        ),
        SizedBox(height: 4,),
        Text("Löschen war erfolreich")
      ],
    );
  }

  Widget _buildFailed(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          width: 48,
          height: 48,
          child: Icon(
            Icons.cancel_outlined,
            size: 48,
            color: Colors.black45,
          )
        ),
        const SizedBox(height: 4,),
        Text("Etwas ist schief gegangen")
      ],
    );
  }

  Widget _buildConfirmDelete(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.label,textAlign: TextAlign.center,),
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: ()=> pop(context,data: false),
              child: const Text("Abbrechen")
            ),
            const SizedBox(width: 16,),
            ElevatedButton(
              onPressed: _onDeletePressed,
              child: const Text("Löschen"),
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent
              )
            )

          ],
        )
      ],
  );
  }
}
