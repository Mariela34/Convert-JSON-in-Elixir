defmodule Schema do
  @derive [Poison.Encoder]
  defstruct [ layers: [], filepath: "default", graphName: "default", graphTitle: "default",
  Xtitle: "default", Ytitle: "default", description: "default" ]
end

defmodule Layer do
  @derive [Poison.Encoder]
  defstruct tgraphDraw: "default", markerStyle: "default", markerColor: "default",
  lineWidth: "default", LineColor: "default",  fillColor: "default"
end

defmodule Layers do
  @derive [Poison.Encoder]
  defstruct trend: [], highlight: []
end


defmodule Functions do

  def newLayer(vtgraphDraw, vmarkerStyle, vmarkerColor, vlineWidth, vLineColor, vfillColor) do
    layer = %Layer{tgraphDraw: vtgraphDraw,  markerStyle: vmarkerStyle, markerColor: vmarkerColor,
    lineWidth: vlineWidth, LineColor: vLineColor, fillColor: vfillColor  }
    layer
  end
  def newSchema(vfilepath, vgraphName, vgraphTitle, vXtitle, vYtitle, vdescription, vlayers) do
    mapSchema = %Schema{filepath: vfilepath, graphName: vgraphName, graphTitle: vgraphTitle,
     Xtitle: vXtitle, Ytitle: vYtitle, description: vdescription, layers: vlayers }
     mapSchema
  end

  def mapLayers(vtrend, vhighlight) do

    layers = %Layers{trend: vtrend, highlight: vhighlight}
    layers

  end

 @doc """

 Para escribir los datos en un json


 """
 defp dump(str) do
   File.write("graphic.json", str)
 end


 def write(graphic) do
  graphic
   |> Enum.map(&Map.from_struct/1) #toma los datos del gráfico y los mapea con la funcion to map
   |> Enum.filter(fn x -> x != nil end) #no mapear lo valores null al filtrarlos
   |> Enum.sort
   |> Poison.encode([offset: true]) # pasarlos a la funcion  to_json
   |> dump # luego a convertirlos en un json

   {:ok, graphic}
 end


end



trend = Functions.newLayer("ALP", "..", "..", "..", "..", "..")
highlight = Functions.newLayer("AC", "..", "..", "..", "..", "..")

layers = Functions.mapLayers(trend, highlight)


schema = Functions.newSchema("..", "trendGraph", "test", "X title", "Y title", "options", layers)

#graphic1 = Functions.setTittle(Functions.newGraphic("ROOT", "C++"), "HOLATITULO")

#layer = Functions.addLayer(graphic1, "regresion", :trend, "df_regresion")

#propertie1 =Functions.addProperty(layer,  :xAxisTitle, "Time")

#propertie2 = Functions.addProperty(layer, :yAxisTitle, "Holi")

IO.inspect(schema)

list = [schema]

Functions.write(list)
