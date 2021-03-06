/* certwatch_db - Database schema
 * Written by Rob Stradling
 * Copyright (C) 2015-2020 Sectigo Limited
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

CREATE OR REPLACE FUNCTION get_parameter(
	parameter				text,
	paramNames				text[],
	paramValues				text[]
) RETURNS text
AS $$
DECLARE
	t_parameter		text;
BEGIN
	t_parameter := lower(parameter);
	FOR i IN 1..array_length(paramNames, 1) LOOP
		IF paramNames[i] = t_parameter THEN
			RETURN paramValues[i];
		END IF;
	END LOOP;

	RETURN NULL;
END;
$$ LANGUAGE plpgsql STRICT;
