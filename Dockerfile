ARG OCAML=4.09
FROM ocaml/opam2:${OCAML}

RUN sudo apt-get update && sudo apt-get install -y libev-dev libgmp-dev libhidapi-dev m4 perl pkg-config

RUN opam repo add remote https://opam.ocaml.org
RUN eval $(opam env)

ARG TEZOS_VERSION=7.1
RUN opam install -y tezos-client.${TEZOS_VERSION}

ENTRYPOINT ["/home/opam/.opam/${OCAML}/bin/tezos-client"]
