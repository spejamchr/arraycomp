module ApplicationHelper
  def line_chart_with graph_info
    line_chart graph_info,
      xtitle: 'Date',
      ytitle: y_label,
      library: {
        interpolateNulls: true,
        pointSize: 0,
        curveType: 'none',
        legend: {
          position: 'top',
          maxLines: 3
        }
      }
  end

  def renewal_flag(depreciable)
    return unless depreciable.flagged?
    icon(
      'exclamation-circle',
      'data-toggle' => 'tooltip',
      class: 'has-tooltip',
      title: depreciable.flagged_reason
    )
  end

  def y_label
    user_options.show_percent_graphs ? '% Total Value' : 'Value (USD)'
  end

end
