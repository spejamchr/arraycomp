$(document).ready ->
  $ ->
    $.extend $.tablesorter.defaults,
      widgets: [
        "zebra"
        "columns"
        "filter"
      ]

    $("table.tablesorter").tablesorter({ sortList: [[0,0]] })

    return
