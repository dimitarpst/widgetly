package com.example.widgetly

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import com.example.widgetly.R
import es.antonborri.home_widget.HomeWidgetPlugin

class BusAppWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (id in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.bus_app_widget)

            val prefs = HomeWidgetPlugin.getData(context)

            val busLine = prefs.getString("line", "Б1") ?: "Б1"
            val timesString = prefs.getString("times", "") ?: ""
            val times = timesString.split(",").map { it.trim() }.filter { it.isNotEmpty() }

            views.setTextViewText(R.id.bus_line, busLine)
            views.setTextViewText(R.id.next_departure, times.getOrNull(0) ?: "—")
            views.setTextViewText(R.id.future_departure1, times.getOrNull(1) ?: "")
            views.setTextViewText(R.id.future_departure2, times.getOrNull(2) ?: "")

            appWidgetManager.updateAppWidget(id, views)
        }
    }
}
