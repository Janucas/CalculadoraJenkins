package model;

import lombok.Data;

@Data

public class Calculadora {

	private static double resultado;
	private double numeroActual;
	private String operadorActual;

	public Calculadora() {
		resultado = 0.0;
		numeroActual = 0.0;
		operadorActual = "";
	}

	public double getResultado() {
		return resultado;
	}

	public void limpiar(StringBuilder mostrar) {
		mostrar.setLength(0);

	}

	public void introducirCalculos(String numero, String operador, StringBuilder mostrar) {

		if (!numero.isEmpty()) {
			numeroActual = Double.parseDouble(numero);
			mostrar.append(numero);
		}

		operadorActual = operador;
		mostrar.append(operador);

	}

	public double resolver(StringBuilder mostrar) {
		resultado = 0; // Inicializar resultado a 0
		int operando = 0; // Inicializar el operando actual a 0
		char operador = '+'; // Inicializar el operador actual a '+'

		for (int i = 0; i < mostrar.length(); i++) {
			char caracter = mostrar.charAt(i);
			if (caracter == '+' || caracter == '-') {
				if (operador == '+') {
					resultado += operando;
				} else if (operador == '-') {
					resultado -= operando;
				}

				operador = caracter;
				operando = 0;
			} else {
				operando = operando * 10 + Character.getNumericValue(caracter);
			}
		}

		if (operador == '+') {
			resultado += operando;
		} else if (operador == '-') {
			resultado -= operando;
		}
		mostrar.delete(0, mostrar.length()); // Vaciar el StringBuilder
		mostrar.append(resultado);
		return resultado;

	}

}