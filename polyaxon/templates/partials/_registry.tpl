{{- define "docker-registry.fullname" -}}
{{- $name := "docker-registry" -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "docker-registry.host" -}}
{{- if (index .Values "docker-registry").enabled }}
{{- template "docker-registry.fullname" . }}
{{- else }}
{{- (index .Values "docker-registry").external.host }}
{{- end }}
{{- end -}}

{{- define "docker-registry.port" -}}
{{- if (index .Values "docker-registry").enabled }}
{{- (index .Values "docker-registry").service.port  }}
{{- else }}
{{- (index .Values "docker-registry").external.port }}
{{- end }}
{{- end -}}
