String? nameValidator(value, [bool? isRequired]) {
  if (value!.isEmpty && (isRequired != null && !isRequired)) {
    return null;
  }
  if (value!.isEmpty) {
    return 'Por favor ingrese los nombres';
  }
  return null;
}

String? lastnameValidator(value, [bool? isRequired]) {
  if (value!.isEmpty && (isRequired != null && !isRequired)) {
    return null;
  }
  if (value!.isEmpty) {
    return 'Por favor ingrese los apellidos';
  }
  return null;
}

String? birthdayValidator(value, [bool? isRequired]) {
  if (value!.isEmpty && (isRequired != null && !isRequired)) {
    return null;
  }
  if (value!.isEmpty) {
    return 'Por favor seleccione una fecha de nacimiento';
  }
  return null;
}

String? emailValidator(value, [bool? isRequired]) {
  if (value!.isEmpty && (isRequired != null && !isRequired)) {
    return null;
  }
  if (value!.isEmpty) {
    return 'Por favor ingrese un correo';
  } else if (!value.contains('@')) {
    return 'Por favor ingrese un correo válido';
  }
  return null;
}

String? directionValidator(value, [bool? isRequired]) {
  if (value!.isEmpty && (isRequired != null && !isRequired)) {
    return null;
  }
  if (value!.isEmpty) {
    return 'Por favor ingrese una dirección';
  }
  return null;
}

String? phoneValidator(value, [bool? isRequired]) {
  if (value!.isEmpty && (isRequired != null && !isRequired)) {
    return null;
  }
  if (value!.isEmpty) {
    return 'Por favor ingrese un número de celular';
  } else if (value!.length < 9) {
    return 'Por favor ingrese un número de celular válido';
  }
  return null;
}

String? DNIValidator(value, [bool? isRequired]) {
  if (value!.isEmpty && (isRequired != null && !isRequired)) {
    return null;
  }
  if (value!.isEmpty) {
    return 'Por favor ingrese un DNI';
  }
  return null;
}

String? weightValidator(value, [bool? isRequired]) {
  if (value!.isEmpty && (isRequired != null && !isRequired)) {
    return null;
  }
  if (value!.isEmpty) {
    return 'Por favor ingrese un peso';
  }
  return null;
}

String? speciesValidator(value, [bool? isRequired]) {
  if (value!.isEmpty && (isRequired != null && !isRequired)) {
    return null;
  }
  if (value!.isEmpty) {
    return 'Por favor ingrese una especie';
  }
  return null;
}

String? subspeciesValidator(value, [bool? isRequired]) {
  if (value!.isEmpty && (isRequired != null && !isRequired)) {
    return null;
  }
  if (value!.isEmpty) {
    return 'Por favor ingrese una raza';
  }
  return null;
}
