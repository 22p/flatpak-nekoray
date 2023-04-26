REPO ?= build/flatpak-repo
STATE ?= build/flatpak-builder
TARGET ?= build/flatpak-target 
APP_ID = io.github.MatsuriDayo.nekoray

all:
	flatpak-builder --ccache --force-clean --repo=$(REPO) --state-dir=$(STATE) $(TARGET) $(APP_ID).yaml

clean:
	rm -rf $(STATE) $(TARGET) *.flatpak .flatpak-builder

dist:
	flatpak build-bundle $(REPO) $(APP_ID).flatpak $(APP_ID)

install:
	flatpak install --reinstall --or-update -y --user $(shell realpath $(REPO)) $(APP_ID)

