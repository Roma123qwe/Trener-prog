unit Unit2;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus,
  Vcl.ComCtrls;
type
  TForm2 = class(TForm)
    MainMenu: TMainMenu;
    GameRulesInfo: TMenuItem;
    Phase1TimerGame: TTimer;
    PageControl: TPageControl;
    MenuPhase: TTabSheet;
    FirstPhase: TTabSheet;
    ThirdPhase: TTabSheet;
    FourthPhase: TTabSheet;
    FifthPhase: TTabSheet;
    StartNewGame: TButton;
    BackPanel: TPanel;
    Task1Label: TLabel;
    ResultLabel: TLabel;
    Task2Label: TLabel;
    GameWordLabel: TLabel;
    ConfirmWord: TButton;
    EnterWord: TEdit;
    WelcomeLabel: TLabel;
    GameInfoLabel: TLabel;
    Requirement1Label: TLabel;
    OpenFromFileDialog: TOpenDialog;
    FileMenu: TMenuItem;
    OpenFromFileMenu: TMenuItem;
    Requirement2Label: TLabel;
    SecondPhase: TTabSheet;
    ThirdWordEdit: TEdit;
    FirstWordEdit: TEdit;
    SecondWordEdit: TEdit;
    Edit4: TEdit;
    FourthWordEdit: TEdit;
    FifthWordEdit: TEdit;
    SixthWord: TEdit;
    SeventhWord: TEdit;
    InputButton: TButton;
    MemoOfWords: TMemo;
    NextButton: TButton;
    SecondPhaseTimer: TTimer;
    BeginningLabel: TLabel;
    ReadyLabel: TLabel;
    procedure StartNewGameClick(Sender: TObject);
    procedure EnterWordKeyPress(Sender: TObject; var Key: Char);
    procedure EnterWordChange(Sender: TObject);
    procedure ConfirmWordClick(Sender: TObject);
    procedure GameRulesInfoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Phase1TimerGameTimer(Sender: TObject);
    procedure OpenFromFileMenuClick(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure FirstWordEditChange(Sender: TObject);
    procedure SecondWordEditChange(Sender: TObject);
    procedure ThirdWordEditChange(Sender: TObject);
    procedure FourthWordEditChange(Sender: TObject);
    procedure FifthWordEditChange(Sender: TObject);
    procedure SecondWordEditKeyPress(Sender: TObject; var Key: Char);
    procedure ThirdWordEditKeyPress(Sender: TObject; var Key: Char);
    procedure SixthWordKeyPress(Sender: TObject; var Key: Char);
    procedure SeventhWordKeyPress(Sender: TObject; var Key: Char);
    procedure FirstWordEditKeyPress(Sender: TObject; var Key: Char);
    procedure FourthWordEditKeyPress(Sender: TObject; var Key: Char);
    procedure FifthWordEditKeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure InputButtonClick(Sender: TObject);
  private
  protected
  public
  end;
var
  Form2: TForm2;
  PhaseCounter, WordCounter: Integer;
  GameWord: String;
  Path, Path_5, Path_6, Path_7, Path_8: String;

implementation
{$R *.dfm}
procedure Delay(Value: Cardinal);
var
  F, N: Cardinal;
begin
  N := 0;
  while N <= (Value div 10) do
  begin
    SleepEx(1, True);
    Application.ProcessMessages;
    Inc(N);
  end;
  F := GetTickCount;
  repeat
    Application.ProcessMessages;
    N := GetTickCount;
  until (N - F >= (Value mod 10)) or (N < F);
end;
Function GetGameWordFromFile(Path: String): String;
Var
   InputFile: TextFile;
   Word: String;
   IsCorrect: Boolean;
   List: TStringList;
   I, N: Integer;
Begin
    IsCorrect := True;
    AssignFile(InputFile,Path);
    If (IsCorrect) Then
    Begin
      Try
        Try
          Reset(InputFile);
          for I := 0 to Unit2.WordCounter - 1 do
          Begin
            Randomize;
            List := TStringList.Create;
            List.LoadFromFile(Path);
            N := random(List.Count);
            Word := List.Strings[N];
            Word := UTF8ToAnsi(Word);
          End;
        Finally
          CloseFile(InputFile);
        End;
      Except
        Application.MessageBox('Îøèáêà ïðè ÷òåíèè äàííûõ èç ôàéëà èãðû!', 'Îøèáêà' , MB_ICONERROR);
      End;
    End;
    GetGameWordFromFile := Word;
End;
Function CompareWords(PlayerWord: String; Path:String): Boolean;
Var
  I, J: Integer;
  GameWord, ReversedGameWord: String;
Begin
  GameWord := Unit2.GameWord;
  J := Length(GameWord);
  ReversedGameWord := GameWord;
  For I := 1 To Length(GameWord) Do
  Begin
    ReversedGameWord[J] := GameWord[I];
    Dec(J);
  End;
  if (PlayerWord = ReversedGameWord) then
    CompareWords := True
  else
    CompareWords := False;
End;
procedure TForm2.ConfirmWordClick(Sender: TObject);
Var
  WordCounter: Integer;
  IsWordCorrect: Boolean;
  GameWord, PlayerWord: String;
begin
  ConfirmWord.Enabled := False;
  WordCounter := 1;
  PlayerWord := EnterWord.Text;
  IsWordCorrect := CompareWords(PlayerWord, Path);
  if IsWordCorrect then
  Begin
    ResultLabel.Visible := True;
    ResultLabel.Font.Color := clGreen;
    ResultLabel.Left := ResultLabel.Left - 80;
    ResultLabel.Caption := 'Ïðàâèëüíûé îòâåò!';
    Inc(Unit2.WordCounter);
    if Unit2.WordCounter > 3 then
    Begin
      Inc(Unit2.PhaseCounter);
      Unit2.WordCounter := 1;
    End;
  End
  Else
  Begin
    ResultLabel.Visible := True;
    ResultLabel.Font.Color := clRed;
    ResultLabel.Left := ResultLabel.Left - 90;
    ResultLabel.Caption := 'Íåïðàâèëüíûé îòâåò!';
  End;
  Delay(500);
  EnterWord.Text := '';
  ResultLabel.Caption := '';
  ResultLabel.Left := 254;
  Phase1TimerGame.Enabled := True;
end;
procedure TForm2.Edit4KeyPress(Sender: TObject; var Key: Char);
Var
    AnsiStr: AnsiString;
Begin
    If (Length(EnterWord.Text) < 1) And (Key = '-') Then
      Key := #0;
    AnsiStr := AnsiString(Key);
    If Not(AnsiStr[1] In ['А'..'Я','А'..'я', #08, #45]) Then
      Key := #0;
end;

procedure TForm2.EnterWordChange(Sender: TObject);
begin
  If(EnterWord.Text <> '') then
  Begin
    ConfirmWord.Enabled := True;
    EnterWord.Font.Color := clCaptionText;
  End
  Else
  Begin
    ConfirmWord.Enabled := False;
    EnterWord.Font.Color := clGray;
  End;
end;
procedure TForm2.EnterWordKeyPress(Sender: TObject; var Key: Char);
var
  AnsiStr: String;
begin
    If (Length(EnterWord.Text) < 1) And (Key = '-') Then
      Key := #0;
    AnsiStr := AnsiString(Key);
    If Not(AnsiStr[1] In ['А'..'Я','а'..'я', #08, #45]) Then
      Key := #0;
end;
procedure TForm2.FifthWordEditChange(Sender: TObject);
begin
    InputButton.Enabled := (Length(Trim(FirstWordEdit.Text)) <> 0) And (Length(Trim(SecondWordEdit.Text)) <> 0) And (Length(Trim(ThirdWordEdit.Text)) <> 0) And (Length(Trim(FourthWordEdit.Text)) <> 0) And (Length(Trim(FifthWordEdit.Text)) <> 0);
end;

procedure TForm2.FifthWordEditKeyPress(Sender: TObject; var Key: Char);
Var
    AnsiStr: AnsiString;
Begin
    If (Length(EnterWord.Text) < 1) And (Key = '-') Then
      Key := #0;
    AnsiStr := AnsiString(Key);
    If Not(AnsiStr[1] In ['А'..'Я','А'..'я', #08, #45]) Then
      Key := #0;
end;

procedure TForm2.FirstWordEditChange(Sender: TObject);
begin
    InputButton.Enabled := (Length(Trim(FirstWordEdit.Text)) <> 0) And (Length(Trim(SecondWordEdit.Text)) <> 0) And (Length(Trim(ThirdWordEdit.Text)) <> 0) And (Length(Trim(FourthWordEdit.Text)) <> 0) And (Length(Trim(FifthWordEdit.Text)) <> 0);
end;

procedure TForm2.FirstWordEditKeyPress(Sender: TObject; var Key: Char);
Var
    AnsiStr: AnsiString;
Begin
    If (Length(EnterWord.Text) < 1) And (Key = '-') Then
      Key := #0;
    AnsiStr := AnsiString(Key);
    If Not(AnsiStr[1] In ['А'..'Я','А'..'я', #08, #45]) Then
      Key := #0;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Var
  WND: HWND;
  lpCaption, lpText: PChar;
  Tip: Integer;
begin
  Phase1TimerGame.Enabled := False;
  WND := Form2.Handle;
  lpCaption := 'Âûõîä';
  lpText := 'Âû óâåðåíû, ÷òî õîòèòå âûéòè?';
  Tip := MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2;
  Case MessageBox(WND, lpText, lpCaption, Tip) Of
      IDYES :
        CanClose := True;
      IDNO :
      Begin
        CanClose := False;
        Phase1TimerGame.Enabled := True;
      End;
  End
end;
procedure TForm2.FourthWordEditChange(Sender: TObject);
Begin
    InputButton.Enabled := (Length(Trim(FirstWordEdit.Text)) <> 0) And (Length(Trim(SecondWordEdit.Text)) <> 0) And (Length(Trim(ThirdWordEdit.Text)) <> 0) And (Length(Trim(FourthWordEdit.Text)) <> 0) And (Length(Trim(FifthWordEdit.Text)) <> 0);
end;

procedure TForm2.FourthWordEditKeyPress(Sender: TObject; var Key: Char);
Var
    AnsiStr: AnsiString;
Begin
    If (Length(EnterWord.Text) < 1) And (Key = '-') Then
      Key := #0;
    AnsiStr := AnsiString(Key);
    If Not(AnsiStr[1] In ['А'..'Я','А'..'я', #08, #45]) Then
      Key := #0;
end;

procedure TForm2.GameRulesInfoClick(Sender: TObject);
Const
  FIRST_MESSAGE = 'Äàííàÿ èãðà ïðåäíàçíà÷åíà äëÿ òðåíèðîâêè ïàìÿòè èãðîêà.' + #13#10;
  SECOND_MESSAGE = 'Â ïðîöåññå èãðû íà ýêðàí áóäó âûâîäèòüñÿ ñëîâà è ÷åðåç íåêîòîðîå âðåìÿ ïðîïàäàòü.' + #13#10;
  THIRD_MESSAGE = 'Çàäà÷åé èãðîêà ÿâëÿåòñÿ çàïîìèíàòü ýòè ñëîâà è ââîäèòü ýòè æå ñëîâà, íî â îáðàòíîì ïîðÿäêå.' + #13#10;
  FOURTH_MESSAGE = 'Ñî âðåìåíåì èãðà íà÷èíàåò óñëîæíÿòüñÿ: ñëîâà ñòàíîâÿòüñÿ äëèííåå. Íà èõ çàïîìèíàíèå äàåòñÿ ÷óòü áîëüøå âðåìåíè.' + #13#10;
  FIFTH_MESSAGE = 'Èãðà çàêàí÷èâàåòñÿ, åñëè èãðîê ïðàâèëüíî ââåäåò òðè ïåðåâåðíóòûõ ñëîâà èç 8 áóêâ.' + #13#10;
  SIXTH_MESSAGE = 'Ïðè ââîäå ó÷èòûâàéòå ðåãèñòð ñèìâîëîâ!';
  SEVENTH_MESSAGE = 'Óäà÷è è óñïåõîâ!';
begin
  Application.MessageBox(FIRST_MESSAGE + SECOND_MESSAGE + THIRD_MESSAGE +
  FOURTH_MESSAGE + FIFTH_MESSAGE + SIXTH_MESSAGE + SEVENTH_MESSAGE, 'Ïðàâèëà èãðû');
end;
procedure TForm2.InputButtonClick(Sender: TObject);
Var
    ArrayOfGameWords: Array[0..4] Of String;
    I: Integer;
begin
    //This will take data from 8 file
//    For I := 0 To 4 Do
//        ArrayOfGameWords[I] := GetGameWordFromFile();
end;

procedure TForm2.NextButtonClick(Sender: TObject);
begin
  FirstPhase.TabVisible := False;
  SecondPhase.Enabled := True;
  SecondPhase.TabVisible := True;
  FirstPhase.Enabled := False;
  BackPanel.Visible := True;

    Delay(500);
    BeginningLabel.Visible := True;
    Delay(300);
    BeginningLabel.Left := BeginningLabel.Left - 5;
    BeginningLabel.Caption := '3.';
    Delay(300);
    BeginningLabel.Left := BeginningLabel.Left - 5;
    BeginningLabel.Caption := '3..';
    Delay(300);
    BeginningLabel.Left := BeginningLabel.Left - 5;
    BeginningLabel.Caption := '3...';
    Delay(300);
    BeginningLabel.Left := BeginningLabel.Left - 5;
    BeginningLabel.Caption := '3... 2';
    Delay(300);
    BeginningLabel.Left := BeginningLabel.Left - 5;
    BeginningLabel.Caption := '3... 2.';
    Delay(300);
    BeginningLabel.Left := BeginningLabel.Left - 5;
    BeginningLabel.Caption := '3... 2..';
    Delay(300);
    BeginningLabel.Left := BeginningLabel.Left - 5;
    BeginningLabel.Caption := '3... 2...';
    Delay(300);
    BeginningLabel.Left := BeginningLabel.Left - 5;
    BeginningLabel.Caption := '3... 2... 1';
    Delay(300);
    BeginningLabel.Left := BeginningLabel.Left - 5;
    BeginningLabel.Caption := '3... 2... 1.';
    Delay(300);
    BeginningLabel.Left := BeginningLabel.Left - 5;
    BeginningLabel.Caption := '3... 2... 1..';
    Delay(300);
    BeginningLabel.Left := BeginningLabel.Left - 5;
    BeginningLabel.Caption := '3... 2... 1...';
    Delay(500);
    BeginningLabel.Left := BeginningLabel.Left - 10;
    BeginningLabel.Caption := '3... 2... 1... Ïîåõàëè!';
    Delay(100);
    BeginningLabel.Font.Color := clGrayText;
    BeginningLabel.Font.Color := clGrayText;
    ReadyLabel.Font.Color := clGrayText;

    FirstWordEdit.Visible := True;
    SecondWordEdit.Visible := True;
    ThirdWordEdit.Visible := True;
    FourthWordEdit.Visible := True;
    FifthWordEdit.Visible := True;
    InputButton.Visible := True;
end;

procedure TForm2.OpenFromFileMenuClick(Sender: TObject);
Var
  I: Integer;
  InputFile: TextFile;
Begin
  Unit2.Path_5 := '';
  Unit2.Path_6 := '';
  Unit2.Path_7 := '';
  Unit2.Path_8 := '';
  OpenFromFileDialog.Filter := 'Text files (*.txt)|*.txt|All files (*.*)|*.*';
  if OpenFromFileDialog.Execute then
  Begin
    with OpenFromFileDialog.Files do
      for I := 0 to OpenFromFileDialog.Files.Count - 1 do
      begin
        AssignFile(InputFile, OpenFromFileDialog.Files[I]);
        Reset(InputFile);
        case I of
          0:
          Begin
            Unit2.Path_5 := OpenFromFileDialog.Files[I];
          End;
          1:
          Begin
            Unit2.Path_6 := OpenFromFileDialog.Files[I];
          End;
          2:
          Begin
            Unit2.Path_7 := OpenFromFileDialog.Files[I];
          End;
          3:
          Begin
            Unit2.Path_8 := OpenFromFileDialog.Files[I];
          End;
        end;
        CloseFile(InputFile);
      end;
    if (Unit2.Path_5 <> '') And (Unit2.Path_6 <> '') And (Unit2.Path_7 <> '') And (Unit2.Path_8 <> '') then
      StartNewGame.Enabled := True
    else
    Begin
      Application.MessageBox('Íåïðàâèëüíûé âûáîð ôàéëîâ, ïîïðîáóéòå åùå ðàç!', 'Îøèáêà!', MB_ICONERROR)
    End;
    OpenFromFileMenu.Enabled := False;
  End;
end;
procedure TForm2.SecondWordEditChange(Sender: TObject);
begin
    InputButton.Enabled := (Length(Trim(FirstWordEdit.Text)) <> 0) And (Length(Trim(SecondWordEdit.Text)) <> 0) And (Length(Trim(ThirdWordEdit.Text)) <> 0) And (Length(Trim(FourthWordEdit.Text)) <> 0) And (Length(Trim(FifthWordEdit.Text)) <> 0);
end;

procedure TForm2.SecondWordEditKeyPress(Sender: TObject; var Key: Char);
Var
    AnsiStr: AnsiString;
begin
    If (Length(EnterWord.Text) < 1) And (Key = '-') Then
      Key := #0;
    AnsiStr := AnsiString(Key);
    If Not(AnsiStr[1] In ['А'..'Я','а'..'я', #08, #45]) Then
      Key := #0;
end;

procedure TForm2.StartNewGameClick(Sender: TObject);
Var
  InputFile: TextFile;
  GameWord: String;
  GameStop: Boolean;
  WordCounter, PhaseCounter: Integer;
begin
    MenuPhase.TabVisible := False;
    FirstPhase.Enabled := True;
    FirstPhase.TabVisible := True;
    MenuPhase.Enabled := False;
    BackPanel.Visible := True;
    StartNewGame.Enabled := False;
    Delay(500);
    Task2Label.Visible := True;
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3.';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3..';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3...';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2.';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2..';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2...';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2... 1';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2... 1.';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2... 1..';
    Delay(300);
    Task2Label.Left := Task2Label.Left - 5;
    Task2Label.Caption := '3... 2... 1...';
    Delay(500);
    Task2Label.Left := Task2Label.Left - 10;
    Task2Label.Caption := '3... 2... 1... Ïîåõàëè!';
    Delay(100);
    Task1Label.Font.Color := clGrayText;
    Task2Label.Font.Color := clGrayText;
  GameWordLabel.Visible := True;
  EnterWord.Visible := True;
  EnterWord.Enabled := True;
  ConfirmWord.Visible := True;
  NextButton.Visible := True;
  Unit2.PhaseCounter := 1;
  Unit2.WordCounter := 1;
  Phase1TimerGame.Enabled := True;
  ConfirmWord.Default := True;
  Unit2.Path := Unit2.Path_5;
end;
procedure TForm2.Phase1TimerGameTimer(Sender: TObject);
begin
  Phase1TimerGame.Enabled := False;
  if Unit2.PhaseCounter = 1 then
  Begin
    Unit2.Path := Unit2.Path_5;
    GameWordLabel.Caption := '';
    GameWordLabel.Left := 254;
    GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := GameWordLabel.Caption;
    Delay(1000);
    GameWordLabel.Caption := '';
    Delay(300);
    GameWordLabel.Left := GameWordLabel.Left - 200;
    GameWordLabel.Font.Size := 10;
    GameWordLabel.Caption := 'Âñïîìíèòå ñëîâî è ââåäèòå åãî íàîáîðîò â ïîëå íèæå';
  End;
  if Unit2.PhaseCounter = 2 then
  Begin
    Unit2.Path := Unit2.Path_6;
    GameWordLabel.Caption := '';
    GameWordLabel.Left := 254;
    GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := GameWordLabel.Caption;
    Delay(1000);
    GameWordLabel.Caption := '';
    Delay(300);
    GameWordLabel.Left := GameWordLabel.Left - 200;
    GameWordLabel.Font.Size := 10;
    GameWordLabel.Caption := 'Âñïîìíèòå ñëîâî è ââåäèòå åãî íàîáîðîò â ïîëå íèæå';
  End;
  if Unit2.PhaseCounter = 3 then
  Begin
    Unit2.Path := Unit2.Path_7;
    GameWordLabel.Caption := '';
    GameWordLabel.Left := 254;
    GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := GameWordLabel.Caption;
    Delay(1000);
    GameWordLabel.Caption := '';
    Delay(300);
    GameWordLabel.Left := GameWordLabel.Left - 200;
    GameWordLabel.Font.Size := 10;
    GameWordLabel.Caption := 'Âñïîìíèòå ñëîâî è ââåäèòå åãî íàîáîðîò â ïîëå íèæå';
  End;
  if Unit2.PhaseCounter = 4 then
  Begin
    Unit2.Path := Unit2.Path_8;
    GameWordLabel.Caption := '';
    GameWordLabel.Left := 254;
    GameWordLabel.Caption := GetGameWordFromFile(Path);
    Unit2.GameWord := GameWordLabel.Caption;
    Delay(1000);
    GameWordLabel.Caption := '';
    Delay(300);
    GameWordLabel.Left := GameWordLabel.Left - 200;
    GameWordLabel.Font.Size := 10;
    GameWordLabel.Caption := 'Âñïîìíèòå ñëîâî è ââåäèòå åãî íàîáîðîò â ïîëå íèæå';
  End;
  if Unit2.PhaseCounter = 5 then
  Begin
    EnterWord.Enabled := False;
    Application.MessageBox('Ïîçäðàâëÿåì ñ ïîáåäîé! Âû ïðîøëè ïåðâûé ýòàï. Ïåðåõîäèì ê ñëåäóþùåìó', 'Ïîáåäà â ïåðâîì ýòàïå!');
    NextButton.Enabled := True;
  End;
end;
procedure TForm2.ThirdWordEditChange(Sender: TObject);
begin
    InputButton.Enabled := (Length(Trim(FirstWordEdit.Text)) <> 0) And (Length(Trim(SecondWordEdit.Text)) <> 0) And (Length(Trim(ThirdWordEdit.Text)) <> 0) And (Length(Trim(FourthWordEdit.Text)) <> 0) And (Length(Trim(FifthWordEdit.Text)) <> 0);
end;

procedure TForm2.ThirdWordEditKeyPress(Sender: TObject; var Key: Char);
Var
    AnsiStr: AnsiString;
Begin
    If (Length(EnterWord.Text) < 1) And (Key = '-') Then
      Key := #0;
    AnsiStr := AnsiString(Key);
    If Not(AnsiStr[1] In ['А'..'Я','А'..'я', #08, #45]) Then
      Key := #0;
end;
procedure TForm2.SixthWordKeyPress(Sender: TObject; var Key: Char);
Var
    AnsiStr: AnsiString;
begin
    If (Length(EnterWord.Text) < 1) And (Key = '-') Then
      Key := #0;
    AnsiStr := AnsiString(Key);
    If Not(AnsiStr[1] In ['А'..'Я','а'..'я', #08, #45]) Then
      Key := #0;
end;
procedure TForm2.SeventhWordKeyPress(Sender: TObject; var Key: Char);
Var
    AnsiStr: AnsiString;
begin
    If (Length(EnterWord.Text) < 1) And (Key = '-') Then
      Key := #0;
    AnsiStr := AnsiString(Key);
    If Not(AnsiStr[1] In ['А'..'Я','а'..'я', #08, #45]) Then
      Key := #0;
end;

end.
