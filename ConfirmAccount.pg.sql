-- (c) Aaron Schulz, 2007

-- Table structure for table `Confirm account`
-- Replace /*$wgDBprefix*/ with the proper prefix

BEGIN;

CREATE SEQUENCE account_requests_acr_id_seq;
CREATE TABLE account_requests (
  acr_id                   INTEGER  NOT NULL DEFAULT nextval('account_requests_acr_id_seq'),
  acr_name                 TEXT     NOT NULL UNIQUE,
  acr_real_name            TEXT,
  acr_email                TEXT,
  acr_email_token          CHAR(32),
  acr_email_token_expires  TIMESTAMPTZ,
  acr_email_authenticated  TIMESTAMPTZ,
  acr_registration         TIMESTAMPTZ,
  acr_bio                  TEXT,
  acr_notes                TEXT,
  acr_url                  TEXT,
  acr_ip                   CIDR,
  acr_rejected             TIMESTAMPTZ,
  acr_user                 INTEGER                REFERENCES mwuser(user_id) ON DELETE SET NULL,
);

CREATE INDEX acr_rejected_reg ON account_requests (acr_rejected,acr_registration),
CREATE INDEX acr_email_token ON account_requests (acr_email_token);

COMMIT;
