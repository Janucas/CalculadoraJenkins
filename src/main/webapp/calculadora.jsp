<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Calculadora"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="calculadora.css">
</head>
<body>

	<%!StringBuilder mostrar = new StringBuilder("");%>
	<%
	String numero = request.getParameter("numeroActual") != null ? request.getParameter("numeroActual") : "";
	String operador = request.getParameter("operadorActual") != null ? request.getParameter("operadorActual") : "";
	Calculadora calculadora = new Calculadora();

	if (request.getParameter("C") != null) {
		calculadora.limpiar(mostrar);
	} else if (request.getParameter("=") != null) {
		calculadora.introducirCalculos(numero, operador, mostrar);
	} else if (request.getParameter("Calculate") != null) {
		calculadora.introducirCalculos(numero, operador, mostrar);
		double resultado = calculadora.resolver(mostrar);
		out.println("Resultado: " + resultado);
	}
	%>


	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="login-container mx-auto">
					<h3>
						<strong>Strange Calculator</strong>
					</h3>
					<form method="get">
						<br> <input type="text" class="form-control" id="resultado"
							name="Resultado" style="height: 100px;" readonly="readonly"
							value="<%out.print(mostrar);%>" aria-describedby="basic-addon3"
							placeholder="Operacion"> <br>
						<table>
							<tr>
								<td><input type="number" placeholder="Enter a number "
									class="form-control" id="dataEntrance" id="numeroActual" name="numeroActual"></td>
									
								<td><select name="operadorActual" id="operadorActual">
										<option name="0"></option>
										<option name="1">+</option>
										<option name="2">-</option>
								</select></td>
							</tr>
						</table>
						<br>
						<table >
							<tr>
								<td >
									<button type="submit" class="btn btn-calculate" id="enviar" name="=" value="enviar"  style="width: 150px;">=</button>
								</td>
								<td><br></td>
								<td>
									<button type="submit" class="btn btn-calculate"  id="borrar" name="C" value="borrar" style="width: 150px;">C</button>
								</td>
							</tr>

						</table>

						<button type="submit" class="btn btn-calculate" id="resolver" name="Calculate" value="resolver">Calculate</button>
					</form>
				</div>

				<br>

			</div>
		</div>
	</div>
</body>
</html>