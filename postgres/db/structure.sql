CREATE TABLE members(id SERIAL PRIMARY KEY,
                     first_name varchar(50) NOT NULL,
                     last_name varchar(50) NOT NULL,
                     email varchar(50) NOT NULL,
                     created_at timestamp NOT NULL default CURRENT_TIMESTAMP);

CREATE INDEX idx_members_id ON members(id);

CREATE UNIQUE INDEX idx_email_unique ON members(email);
