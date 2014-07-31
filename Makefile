GO ?= go

GOPATH  := $(CURDIR)/_vendor:$(GOPATH)
ROCKSDB := $(CURDIR)/_vendor/rocksdb

CGO_CFLAGS  := "-I$(ROCKSDB)/include"
CGO_LDFLAGS := "-L$(ROCKSDB)"

CGO_FLAGS := CGO_LDFLAGS=$(CGO_LDFLAGS) \
             CGO_CFLAGS=$(CGO_CFLAGS)

PKG       := "./..."
TESTS     := ".*"
TESTFLAGS := "--logtostderr"

all: build test

rocksdb:
	cd $(ROCKSDB); make static_lib

build: rocksdb
	$(CGO_FLAGS) $(GO) build

goget:
	$(CGO_FLAGS) $(GO) get ./...

test:
	$(CGO_FLAGS) $(GO) test -run $(TESTS) $(PKG) $(TESTFLAGS)

testrace:
	$(CGO_FLAGS) $(GO) test -race -run $(TESTS) $(PKG) $(TESTFLAGS)

coverage:
	$(CGO_FLAGS) $(GO) test -cover -run $(TESTS) $(PKG) $(TESTFLAGS)

clean:
	$(GO) clean
	cd $(ROCKSDB); make clean
