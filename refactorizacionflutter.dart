import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var listaProductos = [];
  var totalPrecio = 0.0;
  
  void agregarProducto(String nombreProducto, double precioProducto, int cantidadProducto) {
    setState(() {
      listaProductos.add({"Nombre Producto": nombreProducto, "Precio Producto": precioProducto, "Cantidad Producto": cantidadProducto});
      calcularTotalPrecio();
    });
  }
  
  void calcularTotalPrecio() {
    totalPrecio = 0;
    for (var i = 0; i < listaProductos.length; i++) {
      totalPrecio += listaProductos[i]["Precio Producto"] * listaProductos[i]["Cantidad Producto"];
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Mi App")),
        body: Column(
          children: [

            // Interfaz donde se listan los productos almacenados en la lista de productos
            Text("Total: \$${totalPrecio.toStringAsFixed(2)}"),
            Expanded(
              child: ListView.builder(
                itemCount: listaProductos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listaProductos[index]["Nombre Producto"]),
                    subtitle: Text("Precio: \$${listaProductos[index]["Precio Producto"]} x ${listaProductos[index]["Cantidad Producto"]}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
