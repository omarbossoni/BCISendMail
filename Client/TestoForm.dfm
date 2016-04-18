object frmTesto: TfrmTesto
  Left = 0
  Top = 0
  Caption = 'frmTesto'
  ClientHeight = 505
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object edtesto: TMemo
    Left = 0
    Top = 41
    Width = 758
    Height = 464
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    Caption = '  Oggetto: '
    TabOrder = 1
    ExplicitLeft = 285
    ExplicitTop = 35
    ExplicitWidth = 185
    DesignSize = (
      758
      41)
    object edOggetto: TEdit
      Left = 80
      Top = 8
      Width = 666
      Height = 27
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'edOggetto'
    end
  end
end
