import 'dart:math';

import 'package:task_flow_pro/domain/model/task.dart';

const List<String> _taskNotes = [
  "Revisar documentos pendientes",
  "Actualizar notas de la reunión",
  "Organizar los archivos del proyecto",
  "Preparar lista de compras",
  "Limpiar bandeja de entrada",
  "Escribir ideas para el próximo sprint",
  "Revisar tareas completadas",
  "Configurar recordatorios",
  "Terminar la maqueta del diseño",
  "Actualizar información del cliente",
  "Revisar el código y hacer refactor",
  "Preparar presentación",
  "Agregar notas al calendario",
  "Ordenar tareas prioritarias",
  "Hacer seguimiento a pendientes",
  "Revisar estado de la base de datos",
  "Probar nueva funcionalidad",
  "Analizar retroalimentación recibida",
  "Organizar material de referencia",
  "Agregar etiquetas a los documentos",
  "Investigar solución temporal",
  "Revisar logs del sistema",
  "Actualizar configuraciones internas",
  "Planear actividades de la semana",
  "Revisar métricas del proyecto",
  "Hacer limpieza del escritorio virtual",
  "Agregar nuevos objetivos del día",
  "Revisar avances del equipo",
  "Investigar herramientas útiles",
  "Archivar información antigua",
];

const List<String> _taskTitles = [
  "Revisar documentos",
  "Actualizar notas",
  "Organizar archivos",
  "Comprar insumos",
  "Limpiar correos",
  "Planear sprint",
  "Revisar tareas",
  "Configurar alertas",
  "Diseñar maqueta",
  "Actualizar cliente",
  "Refactorizar código",
  "Preparar presentación",
  "Agregar recordatorios",
  "Priorizar pendientes",
  "Hacer seguimiento",
  "Revisar base de datos",
  "Probar feature",
  "Analizar feedback",
  "Organizar recursos",
  "Etiquetar documentos",
  "Investigar solución",
  "Revisar logs",
  "Actualizar sistema",
  "Planear semana",
  "Revisar métricas",
  "Limpiar escritorio",
  "Definir objetivos",
  "Ver avances",
  "Explorar herramientas",
  "Archivar datos",
];

class TaskFakeData {
  List<Task> getListOfTasks([
    int length = 6,
  ]) => List.generate(length, (_) => _generateRandomTask());

  Task _generateRandomTask() {
    final random = Random();
    final randomNumber = random.nextInt(100);
    final bool randomBool = random.nextBool();

    String getRandomItem(
      List<String> items,
      int randomIndex,
    ) => items[randomIndex % items.length];

    String? description;
    String title = getRandomItem(_taskTitles, randomNumber);

    if (randomNumber % 9 != 0) {
      description = getRandomItem(_taskNotes, randomNumber);
    }

    //random date
    DateTime? expectedDate;
    final shouldAddDate = random.nextInt(3) != 2;
    if (shouldAddDate) {
      final actualDate = DateTime.now();
      expectedDate = DateTime(
        actualDate.year,
        random.nextInt(12) + 1,
        random.nextInt(30) + 1,
      );
    }

    return Task(
      notes: description,
      id: randomNumber.toString(),
      title: title,
      isCompleted: randomBool,
      expectedDate: expectedDate,
    );
  }
}
