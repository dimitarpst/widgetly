package com.example.widgetly

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.RemoteViews
import android.widget.Toast
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

            // --- Б1 ---
            val line1 = prefs.getString("line1", "Б1") ?: "Б1"
            val rel1 = prefs.getString("times1_relative", "")?.split(",") ?: listOf()
            val abs1 = prefs.getString("times1_absolute", "")?.split(",") ?: listOf()

            views.setTextViewText(R.id.bus_line, line1)
            views.setTextViewText(R.id.rel1_time1, rel1.getOrNull(0) ?: "--")
            views.setTextViewText(R.id.rel1_time2, rel1.getOrNull(1) ?: "--")
            views.setTextViewText(R.id.rel1_time3, rel1.getOrNull(2) ?: "--")
            views.setTextViewText(R.id.abs1_time1, abs1.getOrNull(0) ?: "--")
            views.setTextViewText(R.id.abs1_time2, abs1.getOrNull(1) ?: "--")
            views.setTextViewText(R.id.abs1_time3, abs1.getOrNull(2) ?: "--")

            // --- Б11 ---
            val line2 = prefs.getString("line2", "Б11") ?: "Б11"
            val rel2 = prefs.getString("times2_relative", "")?.split(",") ?: listOf()
            val abs2 = prefs.getString("times2_absolute", "")?.split(",") ?: listOf()

            views.setTextViewText(R.id.bus_line2, line2)
            views.setTextViewText(R.id.rel2_time1, rel2.getOrNull(0) ?: "--")
            views.setTextViewText(R.id.rel2_time2, rel2.getOrNull(1) ?: "--")
            views.setTextViewText(R.id.rel2_time3, rel2.getOrNull(2) ?: "--")
            views.setTextViewText(R.id.abs2_time1, abs2.getOrNull(0) ?: "--")
            views.setTextViewText(R.id.abs2_time2, abs2.getOrNull(1) ?: "--")
            views.setTextViewText(R.id.abs2_time3, abs2.getOrNull(2) ?: "--")

            // 🔄 Add refresh actions
            val refreshIntent1 = Intent(context, BusAppWidgetProvider::class.java).apply {
                action = "com.example.widgetly.REFRESH_LINE1"
            }
            val refreshPendingIntent1 = PendingIntent.getBroadcast(
                context, 0, refreshIntent1,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.bus_line, refreshPendingIntent1)

            val refreshIntent2 = Intent(context, BusAppWidgetProvider::class.java).apply {
                action = "com.example.widgetly.REFRESH_LINE2"
            }
            val refreshPendingIntent2 = PendingIntent.getBroadcast(
                context, 1, refreshIntent2,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.bus_line2, refreshPendingIntent2)

            appWidgetManager.updateAppWidget(id, views)
        }
    }

    override fun onAppWidgetOptionsChanged(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        newOptions: Bundle
    ) {
        super.onAppWidgetOptionsChanged(context, appWidgetManager, appWidgetId, newOptions)

        val minWidth = newOptions.getInt(AppWidgetManager.OPTION_APPWIDGET_MIN_WIDTH)
        val views = RemoteViews(context.packageName, R.layout.bus_app_widget)

        when {
            minWidth >= 250 -> {
                // Show 3 boxes
                views.setViewVisibility(R.id.timebox1_line1, View.VISIBLE)
                views.setViewVisibility(R.id.timebox2_line1, View.VISIBLE)
                views.setViewVisibility(R.id.timebox3_line1, View.VISIBLE)

                views.setViewVisibility(R.id.timebox1_line2, View.VISIBLE)
                views.setViewVisibility(R.id.timebox2_line2, View.VISIBLE)
                views.setViewVisibility(R.id.timebox3_line2, View.VISIBLE)
            }
            minWidth >= 180 -> {
                // Show 2 boxes
                views.setViewVisibility(R.id.timebox1_line1, View.VISIBLE)
                views.setViewVisibility(R.id.timebox2_line1, View.VISIBLE)
                views.setViewVisibility(R.id.timebox3_line1, View.GONE)

                views.setViewVisibility(R.id.timebox1_line2, View.VISIBLE)
                views.setViewVisibility(R.id.timebox2_line2, View.VISIBLE)
                views.setViewVisibility(R.id.timebox3_line2, View.GONE)
            }
            else -> {
                // Only 1 box
                views.setViewVisibility(R.id.timebox1_line1, View.VISIBLE)
                views.setViewVisibility(R.id.timebox2_line1, View.GONE)
                views.setViewVisibility(R.id.timebox3_line1, View.GONE)

                views.setViewVisibility(R.id.timebox1_line2, View.VISIBLE)
                views.setViewVisibility(R.id.timebox2_line2, View.GONE)
                views.setViewVisibility(R.id.timebox3_line2, View.GONE)
            }
        }

        appWidgetManager.updateAppWidget(appWidgetId, views)
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        when (intent.action) {
            "com.example.widgetly.REFRESH_LINE1" -> {
                Toast.makeText(context, "Refreshing Б1…", Toast.LENGTH_SHORT).show()
                val mgr = AppWidgetManager.getInstance(context)
                val ids = mgr.getAppWidgetIds(ComponentName(context, BusAppWidgetProvider::class.java))
                onUpdate(context, mgr, ids)
            }
            "com.example.widgetly.REFRESH_LINE2" -> {
                Toast.makeText(context, "Refreshing Б11…", Toast.LENGTH_SHORT).show()
                val mgr = AppWidgetManager.getInstance(context)
                val ids = mgr.getAppWidgetIds(ComponentName(context, BusAppWidgetProvider::class.java))
                onUpdate(context, mgr, ids)
            }
        }
    }
}
