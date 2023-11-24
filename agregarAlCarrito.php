<?php
if (!isset($_POST["id"])) {
    return;
}

$id = $_POST["id"];
include_once "base_de_datos.php";
$sentencia = $base_de_datos->prepare("SELECT * FROM tbl_productos WHERE idProducto = ? LIMIT 1;");
$sentencia->execute([$id]);
$producto = $sentencia->fetch(PDO::FETCH_OBJ);
# Si no existe, salimos y lo indicamos
if (!$producto) {
    header("Location: ./vender.php?estado=4");
    exit;
}
# Si no hay cantidadstock...
if ($producto->cantidadstock < 1) {
    header("Location: ./vender.php?estado=5");
    exit;
}
session_start();
# Buscar producto dentro del cartito
$indice = false;
for ($i = 0; $i < count($_SESSION["carrito"]); $i++) {
    if ($_SESSION["carrito"][$i]->id === $id) {
        $indice = $i;
        break;
    }
}
# Si no existe, lo agregamos como nuevo
if ($indice === false) {
    $producto->NoProductos = 1;
    $producto->total = $producto->precio;
    array_push($_SESSION["carrito"], $producto);
} else {
    # Si ya existe, se agrega la cantidad
    # Pero espera, tal vez ya no haya
    $cantidadExistente = $_SESSION["carrito"][$indice]->NoProductos;
    # si al sumarle uno supera lo que existe, no se agrega
    if ($cantidadExistente + 1 > $producto->cantidadstock) {
        header("Location: ./vender.php?estado=5");
        exit;
    }
    $_SESSION["carrito"][$indice]->NoProductos++;
    $_SESSION["carrito"][$indice]->total = $_SESSION["carrito"][$indice]->NoProductos * $_SESSION["carrito"][$indice]->precio;
}
header("Location: ./vender.php");
