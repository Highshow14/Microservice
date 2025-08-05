{{/*
Return the full name of the application, combining release name and chart name
*/}}
{{- define "myservice.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
