
defmodule Graphic do
  defstruct package: "default", lenguage: "default"
end

defmodule TitleGraphic do
  defstruct title: "default"
end

defmodule LayerGraphic do
  defstruct name: "default", type: "default",  df: "default"
end

defmodule PropertyGraphic do
  defstruct property: "default"
end

defmodule Functions do

  def newGraphic(vpackage, vlenguage) do
    mapGraphic = %Graphic{package: vpackage, lenguage: vlenguage}
    IO.inspect(mapGraphic.package)
    mapGraphic
  end

  def setTittle(graphic, vtitle) do
    g1 = Map.merge(graphic, %TitleGraphic{title: vtitle})
    IO.puts(g1.lenguage)
    g1
  end

  def addLayer(graphic, name, vtype, df) do
    g = Map.merge(graphic, %LayerGraphic{name: name, type: vtype, df: df})
    IO.puts(g.type)
    g
  end

  def addProperty(layer, property, value) do
    g = Map.merge(layer, %PropertyGraphic{property: value})
    g
  end

end

Functions.newGraphic("ROOT", "C++")

graphic1 = Functions.setTittle(Functions.newGraphic("ROOT", "C++"), "HOLATITULO")

layer = Functions.addLayer(graphic1, "regresion", :trend, "df_regresion")

Functions.addProperty(layer, :xAxisTitle, "Time")
