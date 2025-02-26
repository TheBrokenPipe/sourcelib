# .PHONY: $(shell mkdir -p obj) lib proj all depend
# all: proj

# lib:
# 	$(MAKE) -C lib

proj: 	$(PROJ_NAME).elf

#compile and link file
$(PROJ_NAME).elf:	$(PROJOBJ) $(OBJS)
	$(CC) $(LDFLAGS) -o $@ -Llib $(OBJS) $(PROJOBJ) $(LD_SYS_LIBS)
	$(OBJCOPY) -O ihex $(PROJ_NAME).elf $(PROJ_NAME).hex
	$(OBJCOPY) -O binary $(PROJ_NAME).elf $(PROJ_NAME).bin

%.o:
	$(CC) $(CFLAGS) -c $< -o $@

depend: .depend

.depend: $(SRCS)
	rm -f ./.depend
	mkdir -p obj
	$(CC) $(CFLAGS) -MM $^>>./.depend;

mflash:
	python3 ${SOURCELIB_ROOT}/tools/programming/flash.py --bin main.bin --addr 0x08000000 --mcu STM32F429ZI --type SWD --speed 400 --erase --rst

flash:
	py ${SOURCELIB_ROOT}/tools/programming/myflash.py

run:
	py ${SOURCELIB_ROOT}/tools/programming/myrun.py
	

clean:
	rm -f *.o
	rm -f $(OBJDIR)/*.o
	rm -f $(PROJ_NAME).elf
	rm -f $(PROJ_NAME).hex
	rm -f $(PROJ_NAME).bin
	rm -f $(LIBNP2)
	rm -rf .depend
	rmdir $(OBJDIR)

