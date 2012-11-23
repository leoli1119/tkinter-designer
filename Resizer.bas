Attribute VB_Name = "Resizer"
Option Explicit
'����ؼ��洰���С������
Private FormOldWidth As Long
Private FormOldHeight As Long

'�ڵ���ResizeFormǰ�ȵ��ñ�����
Public Sub ResizeInit(FormName As Form)
    Dim Obj As Control
    FormOldWidth = FormName.ScaleWidth
    FormOldHeight = FormName.ScaleHeight
    On Error Resume Next
    For Each Obj In FormName
        Obj.Tag = Obj.Left & "," & Obj.Top & "," & Obj.Width & "," & Obj.Height
    Next Obj
    
End Sub

'�������ı�����ڸ�Ԫ���Ĵ�С���ڵ���ReSizeFormǰ�ȵ���ReSizeInit����
Public Sub ResizeForm(FormName As Form)
    Dim pos() As String
    Dim i As Long, TempPos As Long, StartPos As Long
    Dim Obj As Control
    Dim ScaleX As Double, ScaleY As Double
    
    ScaleX = FormName.ScaleWidth / FormOldWidth
    ScaleY = FormName.ScaleHeight / FormOldHeight
    
    On Error Resume Next
    For Each Obj In FormName
        ReDim pos(0) As String
        pos = Split(Obj.Tag, ",")
        If UBound(pos) >= 3 Then
            If TypeName(Obj) = "ComboBox" Then 'ComboBox�߶Ȳ��ܱ�
                Obj.Move CSng(pos(0)) * ScaleX, CSng(pos(1)) * ScaleY, CSng(pos(2)) * ScaleX
            Else
                Obj.Move CSng(pos(0)) * ScaleX, CSng(pos(1)) * ScaleY, CSng(pos(2)) * ScaleX, CSng(pos(3)) * ScaleY
            End If
        End If
    Next
    
End Sub

'��ȡ�ؼ������ʱ�Ŀ���
Public Function GetOrignalWidth(ctl As Control) As Single
    
    Dim pos() As String, i As Long
    
    On Error Resume Next
    pos = Split(ctl.Tag, ",")
    If UBound(pos) >= 3 Then
        GetOrignalWidth = CSng(pos(2))
    Else
        GetOrignalWidth = 0
    End If
    
End Function

'��ȡ�ؼ������ʱ�ĸ߶�
Public Function GetOrignalHeight(ctl As Control) As Single
    
    Dim pos() As String, i As Long
    
    On Error Resume Next
    pos = Split(ctl.Tag, ",")
    If UBound(pos) >= 3 Then
        GetOrignalHeight = CSng(pos(3))
    Else
        GetOrignalHeight = 0
    End If
    
End Function

