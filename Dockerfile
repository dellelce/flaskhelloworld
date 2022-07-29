FROM  python:3.10-alpine as build

# I do not need to create /venv & test account in build stage but I do not appreciate pip install warnings
RUN mkdir /venv && adduser -D test && chown test /venv
USER test

COPY requirements.txt .

RUN python3 -m venv /venv && . /venv/bin/activate && pip --no-cache-dir install -r requirements.txt -U pip setuptools

###
FROM  python:3.10-alpine as final

RUN mkdir /venv && adduser -D test && chown test /venv
USER test

ENV PATH /venv/bin:${PATH}

COPY src /src

WORKDIR /src

ARG PORT=7080
ENV PORT ${PORT}

COPY --from=build /venv /venv

# using shell for only for the PORT variable
CMD flask run -h 0.0.0.0 -p ${PORT}
