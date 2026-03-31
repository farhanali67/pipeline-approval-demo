{{/*
Expand the name of the chart.
*/}}
{{- define "centalhelmchart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Generate common labels
*/}}
{{- define "app.labels" -}}
app: {{ .Values.labels.app }}
app.kubernetes.io/name: {{ .Values.labels.name }}
app.kubernetes.io/instance: {{ .Values.labels.instance }}
app.kubernetes.io/tier: {{ .Values.labels.tier  }}
app.kubernetes.io/part-of: {{ .Values.labels.part}}
app.kubernetes.io/managed-by: {{ .Values.labels.managed }}
{{- end }}



{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "centalhelmchart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "centalhelmchart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "centalhelmchart.labels" -}}
helm.sh/chart: {{ include "centalhelmchart.chart" . }}
{{ include "centalhelmchart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "centalhelmchart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "centalhelmchart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "centalhelmchart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "centalhelmchart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
