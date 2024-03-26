//CATEGORIAS
object gerente {
	method neto() {
		return 15000
	}
}

object cadete {
	method neto() {
		return 20000
	}
}

object medioTiempo{
	var netoMedioTiempo = 0
	method categoriaBase(categoria){
		netoMedioTiempo = categoria.neto() / 2
	}
	method neto(){
		return netoMedioTiempo
	}
}

object vendedor{
	const valorNeto = 16000
	var muchasVentas = true
	method neto(){
		if( muchasVentas == true ){
			return valorNeto * 1.25
		}
		else{
			return valorNeto
		}
	}
	
	method activarAumentoPorMuchasVentas(){
		muchasVentas = true
	}
	
	method desactivarAumentoPorMuchasVentas(){
		muchasVentas = false
	}
	
}
//BONOS DE RESULTADO

object fijo {
	method valor(empleado) {
		return 800
	}
}

object resultadoNulo {
	method valor(empleado) {
		return 0		
	}
	
}

object porcentual {
	
	method valor(empleado) {
		return empleado.neto() * 0.10
	}	
			
}

//Bono Presentismo

object presentismoNulo {
	method valor(empleado) {
		return 0
	}
}

object demagogico {
	method valor(empleado) {
		return if (empleado.neto() < 18000) {
			500
		}
		else {
			300
		}
	}	
}

object normal {
	method valor(empleado) {
		return if (empleado.faltas() == 0) {
			2000
		}else if (empleado.faltas() == 1) {
			1000
		}
		else {
			0
		}
		//return (2000 - empleado.faltas() * 1000).max(0)
	}
	
}

object ajuste {
	method valor(empleado) {
		return if (empleado.faltas() == 0) {100} else {0}
	}
}

object pepe {	
	var categoria = cadete
	var bonoResultado = resultadoNulo
	var bonoPresentismo = presentismoNulo
	var faltas = 0
	
	method faltas(_faltas) {
		faltas = _faltas
	}
	
	method faltas() {
		return faltas	
	}
	
	method categoria(_categoria) {
		categoria = _categoria 
	}
	
	method bonoResultado(_bonoResultado){
		bonoResultado=_bonoResultado
	}
	
	method bonoPresentismo(_bonoPresentismo) {
		bonoPresentismo = _bonoPresentismo
	}
	
	method sueldo() {
		return self.neto() + self.resultado() + self.presentismo() 
	}
	
	method neto() {
		return categoria.neto()	
	}
	
	method resultado() {
		return bonoResultado.valor(self)
	}
	
	method presentismo() {
		return bonoPresentismo.valor(self)
	}
}


object sofia{
	var categoria = cadete
	var bonoResultado = resultadoNulo

	
	method categoria(_categoria) {
		categoria = _categoria 
	}
	
	method bonoResultado(_bonoResultado){
		bonoResultado=_bonoResultado
	}
	
	
	method sueldo() {
		return self.neto() + self.resultado()
	}
	
	method neto() {
		return categoria.neto()	* 1.3
	}
	
	method resultado() {
		return bonoResultado.valor(self)
	}
}

object roque {
	const neto = 28000	
	var categoria = cadete
	var bonoResultado = resultadoNulo
	
	
	method categoria(_categoria) {
		categoria = _categoria 
	}
	
	method bonoResultado(_bonoResultado){
		bonoResultado=_bonoResultado
	}
	
	method sueldo() {
		return neto + self.resultado() + 9000
	}
	
	method resultado() {
		return bonoResultado.valor(self)
	}
}


object ernesto{
	var categoria = cadete
	var bonoPresentismo = presentismoNulo
	var faltas = 0
	
	
	method faltas(_faltas) {
		faltas = _faltas
	}
	
	method faltas() {
		return faltas	
	}
	
	method categoria(_categoria) {
		categoria = _categoria 
	}
	
	
	method bonoPresentismo(_bonoPresentismo) {
		bonoPresentismo = _bonoPresentismo
	}
	
	method sueldo() {
		return self.neto() + self.presentismo() 
	}
	
	method neto() {
		return categoria.neto()	
	}
	
	
	method presentismo() {
		return bonoPresentismo.valor(self)
	}
}