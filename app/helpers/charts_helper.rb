module ChartsHelper
  def all_comp_arrays
    line_chart all_comp_arrays_charts_path,
               xtitle: 'Date',
               ytitle: 'Value (USD)', library: {
                 interpolateNulls: true,
                 pointSize: 0,
                 curveType: 'none',
                 legend: {
                   position: 'top',
                   maxLines: 3
                 }
               }
  end
end
