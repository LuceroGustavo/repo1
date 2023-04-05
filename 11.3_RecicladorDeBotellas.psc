//Necesitamos crear un sistema para una máquina de reciclaje de botellas automática. Dicha máquina nos 
//pagará dinero por la cantidad de plástico reciclado. Tenemos que ingresar nuestro usuario y contraseña 
//para que se nos cargue el saldo por sistema a nuestra cuenta.
//
// [] Condición simple anidada: validaremos que el usuario sea "Albus_D", luego si esto es verdadero, 
//validaremos si la contraseña es "caramelosDeLimon". Si la contraseña es correcta haremos que una variable
//llamada Login sea verdadera.
// [] Bucle Mientras: Este bloque de validación de la contraseña lo encerraremos en un bucle Mientras para 
// darle al usuario sólo 3 intentos para poner la contraseña.
// [] Bucle Hacer Mientras(Repetir): Una vez que el login sea verdadero, accederemos al menú de opciones:
//		* Ingresar botellas
//		* Consultar saldo
//		* Salir
//
// [] Ingresar Botellas: Primero preguntaremos cuántas botellas se va a ingresar al sistema. 
//	Una vez que tenemos el número vamos a usar un bucle para, a fin de ir ingresando cada botella. 
//	En cada ciclo del bucle se debe generar un número aleatorio entre 100 y 3000 gr, que va a ser el peso de las botellas a reciclar (simulando que el usuario está ingresando botellas en la máquina). Una vez generado, según el peso del material, usaremos un condicional múltiple para asignarle un valor monetario:
//		* Si es menos de 500 gr, corresponden $50
//		* Si es entre 501 gr y 1500 gr, corresponden $125
//		* Si es más de 1501 gr, corresponden $200
//	Hecho esto, el programa debe informar al usuario por pantalla el valor que se le ofrece. Si el usuario acepta, 
//	lo acreditamos a su saldo, sino se debe devolver el material (sólo mostrar en pantalla "Devolviendo material"). 
//	Para esto usaremos un condicional doble.
// 
// [] Consultar saldo: revisaremos el valor monetario que tiene asignada la variable "saldo".
// 
// [] Tanto al terminar "Ingresar Botellas" como "Consultar Saldo" debe volver al menú principal.

Algoritmo RecicladorDeBotellas
	Definir usuario,usuarioValido,clave,claveValida,acepta Como Caracter
	Definir intentos,opcionMenu,botellas,contadorBotellas,peso,saldo,montoOfrecido Como Entero
	Definir login Como Logico
	
	usuarioValido="Albus_D"
	claveValida="caramelosDeLimon"
	login=Falso
	intentos=0
	
	hacer 
		
		Escribir "NUEVO CAMBIO USUARIO JULIETA"
		
		Escribir "ESTO ES PARA VER SI tomo el segundo cimit BIEN"
		
		Leer usuario
		Si usuario==usuarioValido
			Mientras login==falso Y intentos<3 
				Escribir "Ingrese su clave:"
				Leer clave
				si clave<>claveValida
					intentos=intentos+1
					Escribir "La clave ingresada es incorrecta. Le quedan ",3-intentos," intentos"
					SI intentos=3
						Escribir "Ha alcanzado el máximo número de intentos incorrectos. Vuelva a ejecutar"
					FinSi
				SiNo
					login=Verdadero
					Escribir "LA clave es correcta. Bienvenido"
				FinSi
			FinMientras
		SiNo
			Escribir "Usuario inválido"
		FinSi
	Mientras Que usuario<>usuarioValido
	
	
	
	Si login==Verdadero
		saldo=0
		opcionMenu=0
		
		Hacer
			Escribir ""
			Escribir "----------------------"
			Escribir "--- MENU PRINCIPAL ---"
			Escribir "----------------------"
			Escribir ""
			Escribir "Elija una opción del menu:"
			Escribir "1) Ingresar botellas"
			Escribir "2) Consultar saldo"
			Escribir "3) Salir"
			Leer opcionMenu
			Si opcionMenu>0 Y opcionMenu<4
				Segun opcionMenu
					1:
						Escribir "¿Cuantas botellas va a ingresar al sistema?"
						Leer botellas
						para contadorBotellas=1 hasta botellas con paso 1 Hacer
							peso=Aleatorio(100,3000)
							Escribir "Se ha ingresado la ",contadorBotellas,"º botella con un peso de ",peso," gramos"
							SI peso <=500 Entonces
								montoOfrecido=50
							SiNo
								si peso>500 Y peso<=1500 Entonces
									montoOfrecido=125
								SiNo
									montoOfrecido=200
								FinSi
							FinSi
							
							Escribir "Por esa cantidad se le ofrecen $",montoOfrecido
							Escribir "¿Acepta este monto? (ingrese SI para aceptar)"
							Leer acepta
							
							Si Minusculas(acepta)=="si" Entonces
								Saldo=saldo+montoOfrecido
								Escribir "Acreditando saldo a su cuenta"
								SiNo
									Escribir "Devolviendo material"
							FinSi
						FinPara
					2:
						Escribir "El valor de saldo en su cuenta es de $",saldo
					3:
						Escribir "Gracias por utilizar nuestra aplicación"
				FinSegun
			SiNo
				Escribir "Esa opción no es valida"
			FinSi
		Mientras Que opcionMenu<>3
		
	FinSi
	
FinAlgoritmo
