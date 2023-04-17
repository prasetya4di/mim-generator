import 'package:objectbox/objectbox.dart';

@Entity()
class EditedMeme {
  @Id()
  int obxId = 0;
  String serverId;
  String filePath;

  EditedMeme({required this.serverId, required this.filePath});
}
