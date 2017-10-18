# $Id: makefile,v 1.11 2004/06/05 09:47:36 hbirr Exp $

PATH_TO_TOP = ../

include $(PATH_TO_TOP)/rulez.mak

all: boot.bin

boot.bin: boot.asm
	$(NASM_CMD) -fbin boot.asm -o boot.bin

clean:
	- $(RM) loadros.com

.PHONY: clean

install: $(INSTALL_DIR)/loadros.com

$(INSTALL_DIR)/loadros.com: loadros.com
	$(CP) loadros.com $(INSTALL_DIR)/loadros.com

.PHONY: install

# EOF
