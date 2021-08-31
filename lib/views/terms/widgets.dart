
import 'package:flutter/cupertino.dart';

import 'cubit.dart';

showTermsDialog(BuildContext context) {
  final controller = TermsCubit.of(context);
  showCupertinoDialog(
    context: (context),
    // MagicRouter.currentContext,
    builder: (context) => CupertinoAlertDialog(
      title: Text('Terms'),
      content: Text('Bla ' * 100),
      actions: [
        CupertinoButton(
          child: Text('Agree'),
          onPressed: () {
            controller.agree(true);
            // MagicRouter.pop();
             Navigator.of(context).pop();
          },
        ),
        CupertinoButton(
          child: Text('Cancel'),
          onPressed:()=> Navigator.of(context).pop()
          // MagicRouter.pop,
        )
      ],
    ),
  );
}
