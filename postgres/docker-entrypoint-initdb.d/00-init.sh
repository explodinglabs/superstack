#!/bin/bash

for tmpl in /docker-entrypoint-initdb.d/templates/*.sql; do
  render_and_run $tmpl
done
