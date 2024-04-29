' MinimaList Controller
' Version 1.07
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
	Private FirstIndex As Int
	Private FirstElement As String
End Sub

Public Sub Initialize (req As ServletRequest, resp As ServletResponse)
	Request = req
	Response = resp
	HRM.Initialize
End Sub

Private Sub ReturnBadRequest
	WebApiUtils.ReturnBadRequest(Response)
End Sub

Private Sub ReturnApiResponse 'ignore
	HRM.SimpleResponse = Main.SimpleResponse
	WebApiUtils.ReturnHttpResponse(HRM, Response)
End Sub

Private Sub ReturnMethodNotAllow
	WebApiUtils.ReturnMethodNotAllow(Response)
End Sub

Private Sub ReturnErrorUnprocessableEntity
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
	If ElementLastIndex > ControllerIndex Then
		FirstIndex = ControllerIndex + 1
		FirstElement = Elements(FirstIndex)
	End If
	
	Select Method
		Case "GET"
			RouteGet
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

' Snippet: Code_WebApiUtils_03 GET Route
Private Sub RouteGet
	Select Version
		Case "v2"
			Select ElementLastIndex
				Case ControllerIndex
					' Snippet: Code_MinimalListUtils_01 Get All Resources
					'GetPlural
					Return
				Case FirstIndex
					If IsNumber(FirstElement) = False Then
						ReturnErrorUnprocessableEntity
						Return
					End If
					' Snippet: Code_MinimalListUtils_02 Get Single Resource
					'GetSingular(FirstElement)
					Return
			End Select
	End Select
	ReturnBadRequest
End Sub