resource "google_bigquery_table" "strava_activity" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "activity"
  description         = "Strava Activity Summary"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/activity.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}


resource "google_bigquery_table" "strava_athlete_summary" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "athlete_summary"
  description         = "Strava Athlete Summary"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/athlete_summary.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}


resource "google_bigquery_table" "strava_altitude_stream" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "altitude"
  description         = "Strava Altitude Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/generic_stream.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}


resource "google_bigquery_table" "strava_cadence_stream" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "cadence"
  description         = "Strava Cadence Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/generic_stream.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}


resource "google_bigquery_table" "strava_distance_stream" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "distance"
  description         = "Strava Distance Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/generic_stream.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}

resource "google_bigquery_table" "strava_heartrate_stream" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "heartrate"
  description         = "Strava Heartrate Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/generic_stream.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}


resource "google_bigquery_table" "strava_latlng_stream" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "latlng"
  description         = "Strava Latitude Longitude Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/latlng.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}


resource "google_bigquery_table" "strava_moving_stream" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "moving"
  description         = "Strava Moving Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/latlng.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}



resource "google_bigquery_table" "strava_power_stream" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "power"
  description         = "Strava Power Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/generic_stream.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}


resource "google_bigquery_table" "strava_grade_smooth_stream" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "grade_smooth"
  description         = "Strava Grade Smooth Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/generic_stream.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}


resource "google_bigquery_table" "strava_time_stream" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "time"
  description         = "Strava Time Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/generic_stream.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}



resource "google_bigquery_table" "strava_velocity_smooth_stream" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "velocity_smooth"
  description         = "Strava Velocity Smooth Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/generic_stream.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}


resource "google_bigquery_table" "strava_temp_stream" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "temp"
  description         = "Strava Temp Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/generic_stream.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}


resource "google_bigquery_table" "strava_watts_stream" {
  dataset_id          = google_bigquery_dataset.bronze_strava.dataset_id
  table_id            = "watts"
  description         = "Strava Watts Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/generic_stream.json")
  deletion_protection = var.environment == "dev" ? true : false
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}
