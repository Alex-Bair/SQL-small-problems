ALTER TABLE stars
DROP CONSTRAINT valid_spectral_type;

CREATE TYPE valid_spectral_types_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars
ALTER COLUMN spectral_type
TYPE valid_spectral_types_enum
USING spectral_type::valid_spectral_types_enum;