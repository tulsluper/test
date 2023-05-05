{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "chartName" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Expand the name of the release
*/}}
{{- define "name" -}}
{{- required "Please specify an app_name at .Values.appName" .Values.appName -}}
{{- end -}}

{{/*
Expand the environment of the release
*/}}
{{- define "environment" -}}
{{- required "Please specify an environment at .Values.environment" .Values.environment -}}
{{- end -}}

{{/*
Expand the vault project name of the release
*/}}
{{- define "vaultUrl" -}}
{{- .Values.vaultUrl | default .Values.vaultUrl -}}
{{- end -}}

{{- define "vaultProjectName" -}}
{{- .Values.vaultProjectName | default .Values.appName -}}
{{- end -}}

{{- define "vaultNamespace" -}}
{{- .Values.vaultNamespace | default .Release.Namespace -}}
{{- end -}}

{{- define "vaultRole" -}}
{{- .Values.vaultRole | default "default" -}}
{{- end -}}

{{- define "vaultAuthPath" -}}
{{- .Values.vaultAuthPath | default "kubernetes" -}}
{{- end -}}

{{- define "fqdn" -}}
{{- .Values.fqdn | default .Values.ingress.fqdn -}}
{{- end -}}

{{- define "vaultCert" -}}
{{- .Values.vaultCert | default .Values.ingress.vaultCert -}}
{{- end -}}

{/*
Return service account name
*/}}
{{- define "serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "name" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}