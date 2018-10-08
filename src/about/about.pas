unit about;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, LCLType, LCLIntf;

type

  { TfrmAbout }

  TfrmAbout = class(TForm)
    bClose: TButton;
    bvBottom: TBevel;
    bvUp: TBevel;
    bvUp1: TBevel;
    iPicture: TImage;
    lWebsite: TLabel;
    Label2: TLabel;
    lAppVersion: TLabel;
    lAppVersionTitle: TLabel;
    lProductNameShadow: TLabel;
    lShenTrad: TLabel;
    lProductName: TLabel;
    mCredits: TMemo;
    procedure bCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Label2DblClick(Sender: TObject);
    procedure lWebsiteClick(Sender: TObject);
    procedure lWebsiteMouseEnter(Sender: TObject);
    procedure lWebsiteMouseLeave(Sender: TObject);
  private

  public

  end;

procedure InitAboutBox(const AppTitle: String; ShortAppTitle: String; AppVersion: String);
procedure RunAboutBox;

const
  CREDITS_RESOURCE_NAME = 'CREDITS';

var
  frmAbout: TfrmAbout;
  sLongAppTitle,
  sShortAppTitle,
  sAppVersion: String;

implementation

{$R *.lfm}

{ TfrmAbout }

procedure InitAboutBox(const AppTitle: String; ShortAppTitle: String; AppVersion: String);
begin
  sLongAppTitle := AppTitle;
  sShortAppTitle := ShortAppTitle;
  sAppVersion := AppVersion;
end;

procedure RunAboutBox;
begin
  frmAbout := tfrmAbout.Create(Application);
  try
    with frmAbout do begin
      Caption := 'About '+sLongAppTitle+'...';
      lAppVersion.Caption := sAppVersion;
      lProductName.Caption := sShortAppTitle;
      lProductNameShadow.Caption := lProductName.Caption;
      ShowModal;
    end;
  finally
    frmAbout.Free;
  end;
end;

procedure TfrmAbout.bCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbout.FormKeyPress(Sender: TObject; var Key: char);
begin
  if Key = Char(VK_ESCAPE) then begin
    Close;
  end;
end;

procedure TfrmAbout.Label2DblClick(Sender: TObject);
begin
  MessageBox(Handle, 'TA DA! YOU FOUND IT !!!', 'KiKOOLOL! :-D', MB_ICONINFORMATION);
  OpenURL('http://sbibuilder.shorturl.com/');
end;

procedure TfrmAbout.lWebsiteClick(Sender: TObject);
begin
  OpenURL('http://shenmuesubs.sf.net');
end;

procedure TfrmAbout.lWebsiteMouseEnter(Sender: TObject);
begin
  with (Sender as TLabel) do begin
    Font.Color := $00FFA360;
    Font.Style := Font.Style+[fsUnderline];
    Cursor := crHandPoint;
  end;
end;

procedure TfrmAbout.lWebsiteMouseLeave(Sender: TObject);
begin
  with (Sender as TLabel) do begin
    Font.Color := clDefault;
    Font.Style := Font.Style-[fsUnderline];
    Cursor := crHandPoint;
  end;
end;

end.

