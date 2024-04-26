ALTER TABLE stars
ALTER COLUMN spectral_type
SET NOT NULL;

ALTER TABLE stars
ADD CONSTRAINT valid_spectral_type
CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M'));