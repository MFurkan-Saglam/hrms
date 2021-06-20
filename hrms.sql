BEGIN;


CREATE TABLE public."Employer"
(
    "companyName" character varying(50)[] NOT NULL,
    id integer NOT NULL,
    "webSiteAdress" character varying(50)[] NOT NULL,
    "phoneNumber" character varying(11)[] NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."JobSearcher"
(
    id integer NOT NULL,
    name character varying(50)[] NOT NULL,
    "lastName" character varying(30)[] NOT NULL,
    "ıdNumber" character varying(11)[] NOT NULL,
    "yearOfBirth" character varying(10)[] NOT NULL,
    "mailAdress" character varying(50)[] NOT NULL,
    password character varying(50)[] NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."SystemPersonel"
(
    id integer NOT NULL,
    name character varying(50)[] NOT NULL,
    lastname character varying(50)[] NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."User"
(
    id integer NOT NULL,
    mail character varying(50)[] NOT NULL,
    password character varying(20)[] NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."signUpSearcher"
(
    "isValid" boolean NOT NULL,
    id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."MernisValidation"
(
    id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."SignUpEmployer"
(
    id integer NOT NULL,
    "isValid" boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."ValidationEmployer"
(
    id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."VerificationCodeSearcher"
(
    id integer NOT NULL,
    "sendCode" integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."VerificationCodeEmployer"
(
    id integer NOT NULL,
    "sendCode" integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."JobPositions"
(
    id integer NOT NULL,
    name character varying(50)[] NOT NULL,
    category character varying(50)[] NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."addPosition"
(
    id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public."ValidatePosition"
(
    id integer NOT NULL,
    "isContains" boolean NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public."Employer"
    ADD FOREIGN KEY (id)
    REFERENCES public."User" (id)
    NOT VALID;


ALTER TABLE public."JobSearcher"
    ADD FOREIGN KEY (id)
    REFERENCES public."User" (id)
    NOT VALID;


ALTER TABLE public."SystemPersonel"
    ADD FOREIGN KEY (id)
    REFERENCES public."User" (id)
    NOT VALID;


ALTER TABLE public."User"
    ADD FOREIGN KEY (id)
    REFERENCES public."signUpSearcher" (id)
    NOT VALID;


ALTER TABLE public."signUpSearcher"
    ADD FOREIGN KEY ("isValid")
    REFERENCES public."MernisValidation" (id)
    NOT VALID;


ALTER TABLE public."SignUpEmployer"
    ADD FOREIGN KEY ("isValid")
    REFERENCES public."ValidationEmployer" (id)
    NOT VALID;


ALTER TABLE public."User"
    ADD FOREIGN KEY (id)
    REFERENCES public."SignUpEmployer" (id)
    NOT VALID;


ALTER TABLE public."signUpSearcher"
    ADD FOREIGN KEY ("isValid")
    REFERENCES public."VerificationCodeSearcher" ("sendCode")
    NOT VALID;


ALTER TABLE public."SignUpEmployer"
    ADD FOREIGN KEY ("isValid")
    REFERENCES public."VerificationCodeEmployer" ("sendCode")
    NOT VALID;


ALTER TABLE public."JobPositions"
    ADD FOREIGN KEY (id)
    REFERENCES public."addPosition" (id)
    NOT VALID;


ALTER TABLE public."addPosition"
    ADD FOREIGN KEY (id)
    REFERENCES public."ValidatePosition" (id)
    NOT VALID;

END;