#!/bin/bash
psql -f ~/certwatch/sql/update_expirations.sql -h $PGHOST -d certwatch -U certwatch
