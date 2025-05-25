unit ufFile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFileForm = class(TForm)
    grpFileActions: TGroupBox;
    btnChooseFile: TButton;
    btnGenerateFile: TButton;
    OpenFileDialog: TOpenDialog;
    procedure btnChooseFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FileForm: TFileForm;

implementation

{$R *.dfm}

procedure TFileForm.btnChooseFileClick(Sender: TObject);
begin
  if OpenFileDialog.Execute then
  begin
    ShowMessage('ֲûבנאם פאיכ: ' + OpenFileDialog.FileName);
  end;

end;

end.
