' MinimaList Controller
' Version 1.06
Sub Class_Globals
	Private Request As ServletRequest
	Private Response As ServletResponse
	Private HRM As HttpResponseMessage
	Private Method As String
	Private Version As String
	Private Elements() As String
	Private ApiVersionIndex As Int
	Private ControllerIndex As Int
	Private ElementLastIndex As Int
	'Private FirstIndex As Int
	'Private FirstElement As String
End Sub

Public Sub Initialize (req As ServletRequest, resp As ServletResponse)
	Request = req
	Response = resp
	HRM.Initialize
End Sub

Private Sub ReturnBadRequest 'ignore
	WebApiUtils.ReturnBadRequest(Response)
End Sub

Private Sub ReturnApiResponse 'ignore
	WebApiUtils.ReturnHttpResponse(HRM, Response)
End Sub

Private Sub ReturnMethodNotAllow 'ignore
	WebApiUtils.ReturnMethodNotAllow(Response)
End Sub

Private Sub ReturnErrorUnprocessableEntity 'ignore
	WebApiUtils.ReturnErrorUnprocessableEntity(Response)
End Sub

' API Router
Public Sub RouteApi
	Method = Request.Method.ToUpperCase
	Elements = WebApiUtils.GetUriElements(Request.RequestURI)
	ElementLastIndex = Elements.Length - 1
	ApiVersionIndex = Main.Element.ApiVersionIndex
	Version = Elements(ApiVersionIndex)
	ControllerIndex = Main.Element.ApiControllerIndex
	'If ElementLastIndex > ControllerIndex Then
	'	FirstIndex = ControllerIndex + 1
	'	FirstElement = Elements(FirstIndex)
	'End If
	
	Select Method
		Case "GET"
			'RouteGet
		Case "POST"
			'RoutePost
		Case "PUT"
			'RoutePut
		Case "DELETE"
			'RouteDelete
		Case Else
			Log("Unsupported method: " & Method)
			ReturnMethodNotAllow
	End Select
End Sub