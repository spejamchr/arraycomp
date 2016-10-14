module ChartsHelper
  def all_comp_arrays
    line_chart all_comp_arrays_charts_path, height: '500px', library: {
      title: {text: 'All Arrays', x: -20},
      yAxis: {
         title: {
             text: 'Value (USD)'
         }
      },
      xAxis: {
         title: {
             text: 'Date'
         }
      }
    }
  end
end
