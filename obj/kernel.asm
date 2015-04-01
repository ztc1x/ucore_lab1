
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 1c 33 00 00       	call   103348 <memset>

    cons_init();                // init the console
  10002c:	e8 3b 15 00 00       	call   10156c <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 e0 34 10 00 	movl   $0x1034e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 fc 34 10 00 	movl   $0x1034fc,(%esp)
  100046:	e8 c7 02 00 00       	call   100312 <cprintf>

    print_kerninfo();
  10004b:	e8 f6 07 00 00       	call   100846 <print_kerninfo>

    grade_backtrace();
  100050:	e8 86 00 00 00       	call   1000db <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 34 29 00 00       	call   10298e <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 50 16 00 00       	call   1016af <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 a2 17 00 00       	call   101806 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 f6 0c 00 00       	call   100d5f <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 af 15 00 00       	call   10161d <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007d:	00 
  10007e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100085:	00 
  100086:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008d:	e8 ff 0b 00 00       	call   100c91 <mon_backtrace>
}
  100092:	c9                   	leave  
  100093:	c3                   	ret    

00100094 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100094:	55                   	push   %ebp
  100095:	89 e5                	mov    %esp,%ebp
  100097:	53                   	push   %ebx
  100098:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009b:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  10009e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a1:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000ab:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000af:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b3:	89 04 24             	mov    %eax,(%esp)
  1000b6:	e8 b5 ff ff ff       	call   100070 <grade_backtrace2>
}
  1000bb:	83 c4 14             	add    $0x14,%esp
  1000be:	5b                   	pop    %ebx
  1000bf:	5d                   	pop    %ebp
  1000c0:	c3                   	ret    

001000c1 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c1:	55                   	push   %ebp
  1000c2:	89 e5                	mov    %esp,%ebp
  1000c4:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1000ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d1:	89 04 24             	mov    %eax,(%esp)
  1000d4:	e8 bb ff ff ff       	call   100094 <grade_backtrace1>
}
  1000d9:	c9                   	leave  
  1000da:	c3                   	ret    

001000db <grade_backtrace>:

void
grade_backtrace(void) {
  1000db:	55                   	push   %ebp
  1000dc:	89 e5                	mov    %esp,%ebp
  1000de:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e1:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e6:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000ed:	ff 
  1000ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000f9:	e8 c3 ff ff ff       	call   1000c1 <grade_backtrace0>
}
  1000fe:	c9                   	leave  
  1000ff:	c3                   	ret    

00100100 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100106:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100109:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010c:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10010f:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100112:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100116:	0f b7 c0             	movzwl %ax,%eax
  100119:	83 e0 03             	and    $0x3,%eax
  10011c:	89 c2                	mov    %eax,%edx
  10011e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100123:	89 54 24 08          	mov    %edx,0x8(%esp)
  100127:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012b:	c7 04 24 01 35 10 00 	movl   $0x103501,(%esp)
  100132:	e8 db 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100137:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013b:	0f b7 d0             	movzwl %ax,%edx
  10013e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100143:	89 54 24 08          	mov    %edx,0x8(%esp)
  100147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014b:	c7 04 24 0f 35 10 00 	movl   $0x10350f,(%esp)
  100152:	e8 bb 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100157:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015b:	0f b7 d0             	movzwl %ax,%edx
  10015e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100163:	89 54 24 08          	mov    %edx,0x8(%esp)
  100167:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016b:	c7 04 24 1d 35 10 00 	movl   $0x10351d,(%esp)
  100172:	e8 9b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100177:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017b:	0f b7 d0             	movzwl %ax,%edx
  10017e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100183:	89 54 24 08          	mov    %edx,0x8(%esp)
  100187:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018b:	c7 04 24 2b 35 10 00 	movl   $0x10352b,(%esp)
  100192:	e8 7b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100197:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019b:	0f b7 d0             	movzwl %ax,%edx
  10019e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a3:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ab:	c7 04 24 39 35 10 00 	movl   $0x103539,(%esp)
  1001b2:	e8 5b 01 00 00       	call   100312 <cprintf>
    round ++;
  1001b7:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001bc:	83 c0 01             	add    $0x1,%eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	c9                   	leave  
  1001c5:	c3                   	ret    

001001c6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c6:	55                   	push   %ebp
  1001c7:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c9:	5d                   	pop    %ebp
  1001ca:	c3                   	ret    

001001cb <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cb:	55                   	push   %ebp
  1001cc:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ce:	5d                   	pop    %ebp
  1001cf:	c3                   	ret    

001001d0 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
  1001d3:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d6:	e8 25 ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001db:	c7 04 24 48 35 10 00 	movl   $0x103548,(%esp)
  1001e2:	e8 2b 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_user();
  1001e7:	e8 da ff ff ff       	call   1001c6 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ec:	e8 0f ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f1:	c7 04 24 68 35 10 00 	movl   $0x103568,(%esp)
  1001f8:	e8 15 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_kernel();
  1001fd:	e8 c9 ff ff ff       	call   1001cb <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100202:	e8 f9 fe ff ff       	call   100100 <lab1_print_cur_status>
}
  100207:	c9                   	leave  
  100208:	c3                   	ret    

00100209 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100209:	55                   	push   %ebp
  10020a:	89 e5                	mov    %esp,%ebp
  10020c:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10020f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100213:	74 13                	je     100228 <readline+0x1f>
        cprintf("%s", prompt);
  100215:	8b 45 08             	mov    0x8(%ebp),%eax
  100218:	89 44 24 04          	mov    %eax,0x4(%esp)
  10021c:	c7 04 24 87 35 10 00 	movl   $0x103587,(%esp)
  100223:	e8 ea 00 00 00       	call   100312 <cprintf>
    }
    int i = 0, c;
  100228:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10022f:	e8 66 01 00 00       	call   10039a <getchar>
  100234:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100237:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10023b:	79 07                	jns    100244 <readline+0x3b>
            return NULL;
  10023d:	b8 00 00 00 00       	mov    $0x0,%eax
  100242:	eb 79                	jmp    1002bd <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100244:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100248:	7e 28                	jle    100272 <readline+0x69>
  10024a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100251:	7f 1f                	jg     100272 <readline+0x69>
            cputchar(c);
  100253:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100256:	89 04 24             	mov    %eax,(%esp)
  100259:	e8 da 00 00 00       	call   100338 <cputchar>
            buf[i ++] = c;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100261:	8d 50 01             	lea    0x1(%eax),%edx
  100264:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100267:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10026a:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100270:	eb 46                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100272:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100276:	75 17                	jne    10028f <readline+0x86>
  100278:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10027c:	7e 11                	jle    10028f <readline+0x86>
            cputchar(c);
  10027e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100281:	89 04 24             	mov    %eax,(%esp)
  100284:	e8 af 00 00 00       	call   100338 <cputchar>
            i --;
  100289:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10028d:	eb 29                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  10028f:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100293:	74 06                	je     10029b <readline+0x92>
  100295:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100299:	75 1d                	jne    1002b8 <readline+0xaf>
            cputchar(c);
  10029b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 92 00 00 00       	call   100338 <cputchar>
            buf[i] = '\0';
  1002a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002a9:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002ae:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b1:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002b6:	eb 05                	jmp    1002bd <readline+0xb4>
        }
    }
  1002b8:	e9 72 ff ff ff       	jmp    10022f <readline+0x26>
}
  1002bd:	c9                   	leave  
  1002be:	c3                   	ret    

001002bf <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002bf:	55                   	push   %ebp
  1002c0:	89 e5                	mov    %esp,%ebp
  1002c2:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1002c8:	89 04 24             	mov    %eax,(%esp)
  1002cb:	e8 c8 12 00 00       	call   101598 <cons_putc>
    (*cnt) ++;
  1002d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d3:	8b 00                	mov    (%eax),%eax
  1002d5:	8d 50 01             	lea    0x1(%eax),%edx
  1002d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002db:	89 10                	mov    %edx,(%eax)
}
  1002dd:	c9                   	leave  
  1002de:	c3                   	ret    

001002df <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002df:	55                   	push   %ebp
  1002e0:	89 e5                	mov    %esp,%ebp
  1002e2:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1002f6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1002fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100301:	c7 04 24 bf 02 10 00 	movl   $0x1002bf,(%esp)
  100308:	e8 54 28 00 00       	call   102b61 <vprintfmt>
    return cnt;
  10030d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100310:	c9                   	leave  
  100311:	c3                   	ret    

00100312 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100312:	55                   	push   %ebp
  100313:	89 e5                	mov    %esp,%ebp
  100315:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100318:	8d 45 0c             	lea    0xc(%ebp),%eax
  10031b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10031e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100321:	89 44 24 04          	mov    %eax,0x4(%esp)
  100325:	8b 45 08             	mov    0x8(%ebp),%eax
  100328:	89 04 24             	mov    %eax,(%esp)
  10032b:	e8 af ff ff ff       	call   1002df <vcprintf>
  100330:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100333:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100336:	c9                   	leave  
  100337:	c3                   	ret    

00100338 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100338:	55                   	push   %ebp
  100339:	89 e5                	mov    %esp,%ebp
  10033b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10033e:	8b 45 08             	mov    0x8(%ebp),%eax
  100341:	89 04 24             	mov    %eax,(%esp)
  100344:	e8 4f 12 00 00       	call   101598 <cons_putc>
}
  100349:	c9                   	leave  
  10034a:	c3                   	ret    

0010034b <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10034b:	55                   	push   %ebp
  10034c:	89 e5                	mov    %esp,%ebp
  10034e:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100351:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100358:	eb 13                	jmp    10036d <cputs+0x22>
        cputch(c, &cnt);
  10035a:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10035e:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100361:	89 54 24 04          	mov    %edx,0x4(%esp)
  100365:	89 04 24             	mov    %eax,(%esp)
  100368:	e8 52 ff ff ff       	call   1002bf <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  10036d:	8b 45 08             	mov    0x8(%ebp),%eax
  100370:	8d 50 01             	lea    0x1(%eax),%edx
  100373:	89 55 08             	mov    %edx,0x8(%ebp)
  100376:	0f b6 00             	movzbl (%eax),%eax
  100379:	88 45 f7             	mov    %al,-0x9(%ebp)
  10037c:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100380:	75 d8                	jne    10035a <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100382:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100385:	89 44 24 04          	mov    %eax,0x4(%esp)
  100389:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  100390:	e8 2a ff ff ff       	call   1002bf <cputch>
    return cnt;
  100395:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100398:	c9                   	leave  
  100399:	c3                   	ret    

0010039a <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10039a:	55                   	push   %ebp
  10039b:	89 e5                	mov    %esp,%ebp
  10039d:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003a0:	e8 1c 12 00 00       	call   1015c1 <cons_getc>
  1003a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ac:	74 f2                	je     1003a0 <getchar+0x6>
        /* do nothing */;
    return c;
  1003ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003b1:	c9                   	leave  
  1003b2:	c3                   	ret    

001003b3 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003b3:	55                   	push   %ebp
  1003b4:	89 e5                	mov    %esp,%ebp
  1003b6:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003bc:	8b 00                	mov    (%eax),%eax
  1003be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1003c4:	8b 00                	mov    (%eax),%eax
  1003c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003d0:	e9 d2 00 00 00       	jmp    1004a7 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1003d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003db:	01 d0                	add    %edx,%eax
  1003dd:	89 c2                	mov    %eax,%edx
  1003df:	c1 ea 1f             	shr    $0x1f,%edx
  1003e2:	01 d0                	add    %edx,%eax
  1003e4:	d1 f8                	sar    %eax
  1003e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003ec:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003ef:	eb 04                	jmp    1003f5 <stab_binsearch+0x42>
            m --;
  1003f1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003fb:	7c 1f                	jl     10041c <stab_binsearch+0x69>
  1003fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100400:	89 d0                	mov    %edx,%eax
  100402:	01 c0                	add    %eax,%eax
  100404:	01 d0                	add    %edx,%eax
  100406:	c1 e0 02             	shl    $0x2,%eax
  100409:	89 c2                	mov    %eax,%edx
  10040b:	8b 45 08             	mov    0x8(%ebp),%eax
  10040e:	01 d0                	add    %edx,%eax
  100410:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100414:	0f b6 c0             	movzbl %al,%eax
  100417:	3b 45 14             	cmp    0x14(%ebp),%eax
  10041a:	75 d5                	jne    1003f1 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  10041c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10041f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100422:	7d 0b                	jge    10042f <stab_binsearch+0x7c>
            l = true_m + 1;
  100424:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100427:	83 c0 01             	add    $0x1,%eax
  10042a:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10042d:	eb 78                	jmp    1004a7 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  10042f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100436:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100439:	89 d0                	mov    %edx,%eax
  10043b:	01 c0                	add    %eax,%eax
  10043d:	01 d0                	add    %edx,%eax
  10043f:	c1 e0 02             	shl    $0x2,%eax
  100442:	89 c2                	mov    %eax,%edx
  100444:	8b 45 08             	mov    0x8(%ebp),%eax
  100447:	01 d0                	add    %edx,%eax
  100449:	8b 40 08             	mov    0x8(%eax),%eax
  10044c:	3b 45 18             	cmp    0x18(%ebp),%eax
  10044f:	73 13                	jae    100464 <stab_binsearch+0xb1>
            *region_left = m;
  100451:	8b 45 0c             	mov    0xc(%ebp),%eax
  100454:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100457:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100459:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10045c:	83 c0 01             	add    $0x1,%eax
  10045f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100462:	eb 43                	jmp    1004a7 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100464:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100467:	89 d0                	mov    %edx,%eax
  100469:	01 c0                	add    %eax,%eax
  10046b:	01 d0                	add    %edx,%eax
  10046d:	c1 e0 02             	shl    $0x2,%eax
  100470:	89 c2                	mov    %eax,%edx
  100472:	8b 45 08             	mov    0x8(%ebp),%eax
  100475:	01 d0                	add    %edx,%eax
  100477:	8b 40 08             	mov    0x8(%eax),%eax
  10047a:	3b 45 18             	cmp    0x18(%ebp),%eax
  10047d:	76 16                	jbe    100495 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10047f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100482:	8d 50 ff             	lea    -0x1(%eax),%edx
  100485:	8b 45 10             	mov    0x10(%ebp),%eax
  100488:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10048a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10048d:	83 e8 01             	sub    $0x1,%eax
  100490:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100493:	eb 12                	jmp    1004a7 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100495:	8b 45 0c             	mov    0xc(%ebp),%eax
  100498:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10049b:	89 10                	mov    %edx,(%eax)
            l = m;
  10049d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004a3:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004ad:	0f 8e 22 ff ff ff    	jle    1003d5 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004b7:	75 0f                	jne    1004c8 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  1004b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004bc:	8b 00                	mov    (%eax),%eax
  1004be:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c4:	89 10                	mov    %edx,(%eax)
  1004c6:	eb 3f                	jmp    100507 <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004c8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004cb:	8b 00                	mov    (%eax),%eax
  1004cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004d0:	eb 04                	jmp    1004d6 <stab_binsearch+0x123>
  1004d2:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d9:	8b 00                	mov    (%eax),%eax
  1004db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004de:	7d 1f                	jge    1004ff <stab_binsearch+0x14c>
  1004e0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004e3:	89 d0                	mov    %edx,%eax
  1004e5:	01 c0                	add    %eax,%eax
  1004e7:	01 d0                	add    %edx,%eax
  1004e9:	c1 e0 02             	shl    $0x2,%eax
  1004ec:	89 c2                	mov    %eax,%edx
  1004ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f1:	01 d0                	add    %edx,%eax
  1004f3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f7:	0f b6 c0             	movzbl %al,%eax
  1004fa:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004fd:	75 d3                	jne    1004d2 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1004ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  100502:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100505:	89 10                	mov    %edx,(%eax)
    }
}
  100507:	c9                   	leave  
  100508:	c3                   	ret    

00100509 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100509:	55                   	push   %ebp
  10050a:	89 e5                	mov    %esp,%ebp
  10050c:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10050f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100512:	c7 00 8c 35 10 00    	movl   $0x10358c,(%eax)
    info->eip_line = 0;
  100518:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100522:	8b 45 0c             	mov    0xc(%ebp),%eax
  100525:	c7 40 08 8c 35 10 00 	movl   $0x10358c,0x8(%eax)
    info->eip_fn_namelen = 9;
  10052c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052f:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100536:	8b 45 0c             	mov    0xc(%ebp),%eax
  100539:	8b 55 08             	mov    0x8(%ebp),%edx
  10053c:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10053f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100542:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100549:	c7 45 f4 ec 3d 10 00 	movl   $0x103dec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100550:	c7 45 f0 2c b5 10 00 	movl   $0x10b52c,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100557:	c7 45 ec 2d b5 10 00 	movl   $0x10b52d,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10055e:	c7 45 e8 1f d5 10 00 	movl   $0x10d51f,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100565:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100568:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10056b:	76 0d                	jbe    10057a <debuginfo_eip+0x71>
  10056d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100570:	83 e8 01             	sub    $0x1,%eax
  100573:	0f b6 00             	movzbl (%eax),%eax
  100576:	84 c0                	test   %al,%al
  100578:	74 0a                	je     100584 <debuginfo_eip+0x7b>
        return -1;
  10057a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10057f:	e9 c0 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100584:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10058b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10058e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100591:	29 c2                	sub    %eax,%edx
  100593:	89 d0                	mov    %edx,%eax
  100595:	c1 f8 02             	sar    $0x2,%eax
  100598:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10059e:	83 e8 01             	sub    $0x1,%eax
  1005a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005ab:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005b2:	00 
  1005b3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005b6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ba:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005c4:	89 04 24             	mov    %eax,(%esp)
  1005c7:	e8 e7 fd ff ff       	call   1003b3 <stab_binsearch>
    if (lfile == 0)
  1005cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005cf:	85 c0                	test   %eax,%eax
  1005d1:	75 0a                	jne    1005dd <debuginfo_eip+0xd4>
        return -1;
  1005d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005d8:	e9 67 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ec:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005f0:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005f7:	00 
  1005f8:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ff:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100602:	89 44 24 04          	mov    %eax,0x4(%esp)
  100606:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100609:	89 04 24             	mov    %eax,(%esp)
  10060c:	e8 a2 fd ff ff       	call   1003b3 <stab_binsearch>

    if (lfun <= rfun) {
  100611:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100614:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100617:	39 c2                	cmp    %eax,%edx
  100619:	7f 7c                	jg     100697 <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10061b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10061e:	89 c2                	mov    %eax,%edx
  100620:	89 d0                	mov    %edx,%eax
  100622:	01 c0                	add    %eax,%eax
  100624:	01 d0                	add    %edx,%eax
  100626:	c1 e0 02             	shl    $0x2,%eax
  100629:	89 c2                	mov    %eax,%edx
  10062b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10062e:	01 d0                	add    %edx,%eax
  100630:	8b 10                	mov    (%eax),%edx
  100632:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100635:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100638:	29 c1                	sub    %eax,%ecx
  10063a:	89 c8                	mov    %ecx,%eax
  10063c:	39 c2                	cmp    %eax,%edx
  10063e:	73 22                	jae    100662 <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100640:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100643:	89 c2                	mov    %eax,%edx
  100645:	89 d0                	mov    %edx,%eax
  100647:	01 c0                	add    %eax,%eax
  100649:	01 d0                	add    %edx,%eax
  10064b:	c1 e0 02             	shl    $0x2,%eax
  10064e:	89 c2                	mov    %eax,%edx
  100650:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100653:	01 d0                	add    %edx,%eax
  100655:	8b 10                	mov    (%eax),%edx
  100657:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10065a:	01 c2                	add    %eax,%edx
  10065c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065f:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100662:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100665:	89 c2                	mov    %eax,%edx
  100667:	89 d0                	mov    %edx,%eax
  100669:	01 c0                	add    %eax,%eax
  10066b:	01 d0                	add    %edx,%eax
  10066d:	c1 e0 02             	shl    $0x2,%eax
  100670:	89 c2                	mov    %eax,%edx
  100672:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100675:	01 d0                	add    %edx,%eax
  100677:	8b 50 08             	mov    0x8(%eax),%edx
  10067a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	8b 40 10             	mov    0x10(%eax),%eax
  100686:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100689:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10068c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10068f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100692:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100695:	eb 15                	jmp    1006ac <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100697:	8b 45 0c             	mov    0xc(%ebp),%eax
  10069a:	8b 55 08             	mov    0x8(%ebp),%edx
  10069d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006af:	8b 40 08             	mov    0x8(%eax),%eax
  1006b2:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006b9:	00 
  1006ba:	89 04 24             	mov    %eax,(%esp)
  1006bd:	e8 fa 2a 00 00       	call   1031bc <strfind>
  1006c2:	89 c2                	mov    %eax,%edx
  1006c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c7:	8b 40 08             	mov    0x8(%eax),%eax
  1006ca:	29 c2                	sub    %eax,%edx
  1006cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006cf:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1006d5:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006d9:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e0:	00 
  1006e1:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006e4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006e8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f2:	89 04 24             	mov    %eax,(%esp)
  1006f5:	e8 b9 fc ff ff       	call   1003b3 <stab_binsearch>
    if (lline <= rline) {
  1006fa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100700:	39 c2                	cmp    %eax,%edx
  100702:	7f 24                	jg     100728 <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  100704:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100707:	89 c2                	mov    %eax,%edx
  100709:	89 d0                	mov    %edx,%eax
  10070b:	01 c0                	add    %eax,%eax
  10070d:	01 d0                	add    %edx,%eax
  10070f:	c1 e0 02             	shl    $0x2,%eax
  100712:	89 c2                	mov    %eax,%edx
  100714:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100717:	01 d0                	add    %edx,%eax
  100719:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10071d:	0f b7 d0             	movzwl %ax,%edx
  100720:	8b 45 0c             	mov    0xc(%ebp),%eax
  100723:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100726:	eb 13                	jmp    10073b <debuginfo_eip+0x232>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  100728:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10072d:	e9 12 01 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100732:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100735:	83 e8 01             	sub    $0x1,%eax
  100738:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10073b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10073e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100741:	39 c2                	cmp    %eax,%edx
  100743:	7c 56                	jl     10079b <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  100745:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100748:	89 c2                	mov    %eax,%edx
  10074a:	89 d0                	mov    %edx,%eax
  10074c:	01 c0                	add    %eax,%eax
  10074e:	01 d0                	add    %edx,%eax
  100750:	c1 e0 02             	shl    $0x2,%eax
  100753:	89 c2                	mov    %eax,%edx
  100755:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100758:	01 d0                	add    %edx,%eax
  10075a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10075e:	3c 84                	cmp    $0x84,%al
  100760:	74 39                	je     10079b <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100762:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100765:	89 c2                	mov    %eax,%edx
  100767:	89 d0                	mov    %edx,%eax
  100769:	01 c0                	add    %eax,%eax
  10076b:	01 d0                	add    %edx,%eax
  10076d:	c1 e0 02             	shl    $0x2,%eax
  100770:	89 c2                	mov    %eax,%edx
  100772:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100775:	01 d0                	add    %edx,%eax
  100777:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10077b:	3c 64                	cmp    $0x64,%al
  10077d:	75 b3                	jne    100732 <debuginfo_eip+0x229>
  10077f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100782:	89 c2                	mov    %eax,%edx
  100784:	89 d0                	mov    %edx,%eax
  100786:	01 c0                	add    %eax,%eax
  100788:	01 d0                	add    %edx,%eax
  10078a:	c1 e0 02             	shl    $0x2,%eax
  10078d:	89 c2                	mov    %eax,%edx
  10078f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100792:	01 d0                	add    %edx,%eax
  100794:	8b 40 08             	mov    0x8(%eax),%eax
  100797:	85 c0                	test   %eax,%eax
  100799:	74 97                	je     100732 <debuginfo_eip+0x229>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10079b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10079e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a1:	39 c2                	cmp    %eax,%edx
  1007a3:	7c 46                	jl     1007eb <debuginfo_eip+0x2e2>
  1007a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007a8:	89 c2                	mov    %eax,%edx
  1007aa:	89 d0                	mov    %edx,%eax
  1007ac:	01 c0                	add    %eax,%eax
  1007ae:	01 d0                	add    %edx,%eax
  1007b0:	c1 e0 02             	shl    $0x2,%eax
  1007b3:	89 c2                	mov    %eax,%edx
  1007b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007b8:	01 d0                	add    %edx,%eax
  1007ba:	8b 10                	mov    (%eax),%edx
  1007bc:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007c2:	29 c1                	sub    %eax,%ecx
  1007c4:	89 c8                	mov    %ecx,%eax
  1007c6:	39 c2                	cmp    %eax,%edx
  1007c8:	73 21                	jae    1007eb <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007ca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cd:	89 c2                	mov    %eax,%edx
  1007cf:	89 d0                	mov    %edx,%eax
  1007d1:	01 c0                	add    %eax,%eax
  1007d3:	01 d0                	add    %edx,%eax
  1007d5:	c1 e0 02             	shl    $0x2,%eax
  1007d8:	89 c2                	mov    %eax,%edx
  1007da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007dd:	01 d0                	add    %edx,%eax
  1007df:	8b 10                	mov    (%eax),%edx
  1007e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007e4:	01 c2                	add    %eax,%edx
  1007e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007eb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f1:	39 c2                	cmp    %eax,%edx
  1007f3:	7d 4a                	jge    10083f <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1007f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007f8:	83 c0 01             	add    $0x1,%eax
  1007fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007fe:	eb 18                	jmp    100818 <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100800:	8b 45 0c             	mov    0xc(%ebp),%eax
  100803:	8b 40 14             	mov    0x14(%eax),%eax
  100806:	8d 50 01             	lea    0x1(%eax),%edx
  100809:	8b 45 0c             	mov    0xc(%ebp),%eax
  10080c:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  10080f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100812:	83 c0 01             	add    $0x1,%eax
  100815:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100818:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10081e:	39 c2                	cmp    %eax,%edx
  100820:	7d 1d                	jge    10083f <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100825:	89 c2                	mov    %eax,%edx
  100827:	89 d0                	mov    %edx,%eax
  100829:	01 c0                	add    %eax,%eax
  10082b:	01 d0                	add    %edx,%eax
  10082d:	c1 e0 02             	shl    $0x2,%eax
  100830:	89 c2                	mov    %eax,%edx
  100832:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100835:	01 d0                	add    %edx,%eax
  100837:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10083b:	3c a0                	cmp    $0xa0,%al
  10083d:	74 c1                	je     100800 <debuginfo_eip+0x2f7>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10083f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100844:	c9                   	leave  
  100845:	c3                   	ret    

00100846 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100846:	55                   	push   %ebp
  100847:	89 e5                	mov    %esp,%ebp
  100849:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10084c:	c7 04 24 96 35 10 00 	movl   $0x103596,(%esp)
  100853:	e8 ba fa ff ff       	call   100312 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100858:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10085f:	00 
  100860:	c7 04 24 af 35 10 00 	movl   $0x1035af,(%esp)
  100867:	e8 a6 fa ff ff       	call   100312 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10086c:	c7 44 24 04 d1 34 10 	movl   $0x1034d1,0x4(%esp)
  100873:	00 
  100874:	c7 04 24 c7 35 10 00 	movl   $0x1035c7,(%esp)
  10087b:	e8 92 fa ff ff       	call   100312 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100880:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100887:	00 
  100888:	c7 04 24 df 35 10 00 	movl   $0x1035df,(%esp)
  10088f:	e8 7e fa ff ff       	call   100312 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100894:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  10089b:	00 
  10089c:	c7 04 24 f7 35 10 00 	movl   $0x1035f7,(%esp)
  1008a3:	e8 6a fa ff ff       	call   100312 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008a8:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  1008ad:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b3:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008b8:	29 c2                	sub    %eax,%edx
  1008ba:	89 d0                	mov    %edx,%eax
  1008bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008c2:	85 c0                	test   %eax,%eax
  1008c4:	0f 48 c2             	cmovs  %edx,%eax
  1008c7:	c1 f8 0a             	sar    $0xa,%eax
  1008ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ce:	c7 04 24 10 36 10 00 	movl   $0x103610,(%esp)
  1008d5:	e8 38 fa ff ff       	call   100312 <cprintf>
}
  1008da:	c9                   	leave  
  1008db:	c3                   	ret    

001008dc <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008dc:	55                   	push   %ebp
  1008dd:	89 e5                	mov    %esp,%ebp
  1008df:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008e5:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ef:	89 04 24             	mov    %eax,(%esp)
  1008f2:	e8 12 fc ff ff       	call   100509 <debuginfo_eip>
  1008f7:	85 c0                	test   %eax,%eax
  1008f9:	74 15                	je     100910 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1008fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100902:	c7 04 24 3a 36 10 00 	movl   $0x10363a,(%esp)
  100909:	e8 04 fa ff ff       	call   100312 <cprintf>
  10090e:	eb 6d                	jmp    10097d <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100910:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100917:	eb 1c                	jmp    100935 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  100919:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10091c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091f:	01 d0                	add    %edx,%eax
  100921:	0f b6 00             	movzbl (%eax),%eax
  100924:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10092a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10092d:	01 ca                	add    %ecx,%edx
  10092f:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100931:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100935:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100938:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  10093b:	7f dc                	jg     100919 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  10093d:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100943:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100946:	01 d0                	add    %edx,%eax
  100948:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  10094b:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10094e:	8b 55 08             	mov    0x8(%ebp),%edx
  100951:	89 d1                	mov    %edx,%ecx
  100953:	29 c1                	sub    %eax,%ecx
  100955:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100958:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10095b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  10095f:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100965:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100969:	89 54 24 08          	mov    %edx,0x8(%esp)
  10096d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100971:	c7 04 24 56 36 10 00 	movl   $0x103656,(%esp)
  100978:	e8 95 f9 ff ff       	call   100312 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  10097d:	c9                   	leave  
  10097e:	c3                   	ret    

0010097f <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10097f:	55                   	push   %ebp
  100980:	89 e5                	mov    %esp,%ebp
  100982:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100985:	8b 45 04             	mov    0x4(%ebp),%eax
  100988:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  10098b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10098e:	c9                   	leave  
  10098f:	c3                   	ret    

00100990 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100990:	55                   	push   %ebp
  100991:	89 e5                	mov    %esp,%ebp
  100993:	83 ec 28             	sub    $0x28,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100996:	89 e8                	mov    %ebp,%eax
  100998:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return ebp;
  10099b:	8b 45 e8             	mov    -0x18(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t current_ebp = read_ebp();
  10099e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	uint32_t current_eip = read_eip();
  1009a1:	e8 d9 ff ff ff       	call   10097f <read_eip>
  1009a6:	89 45 f0             	mov    %eax,-0x10(%ebp)

	while(current_ebp != 0)
  1009a9:	e9 9b 00 00 00       	jmp    100a49 <print_stackframe+0xb9>
	{
		cprintf("ebp:0x%08x ", current_ebp);
  1009ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009b1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009b5:	c7 04 24 68 36 10 00 	movl   $0x103668,(%esp)
  1009bc:	e8 51 f9 ff ff       	call   100312 <cprintf>
		cprintf("eip:0x%08x ", current_eip);
  1009c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009c4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009c8:	c7 04 24 74 36 10 00 	movl   $0x103674,(%esp)
  1009cf:	e8 3e f9 ff ff       	call   100312 <cprintf>

		cprintf("args:");
  1009d4:	c7 04 24 80 36 10 00 	movl   $0x103680,(%esp)
  1009db:	e8 32 f9 ff ff       	call   100312 <cprintf>
		int i = 0;
  1009e0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for(i = 0; i < 4; i ++)
  1009e7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  1009ee:	eb 26                	jmp    100a16 <print_stackframe+0x86>
			cprintf("0x%08x ", (uint32_t)(*(uint32_t*)(current_ebp + 8 + 4*i)));
  1009f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009f3:	c1 e0 02             	shl    $0x2,%eax
  1009f6:	89 c2                	mov    %eax,%edx
  1009f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009fb:	01 d0                	add    %edx,%eax
  1009fd:	83 c0 08             	add    $0x8,%eax
  100a00:	8b 00                	mov    (%eax),%eax
  100a02:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a06:	c7 04 24 86 36 10 00 	movl   $0x103686,(%esp)
  100a0d:	e8 00 f9 ff ff       	call   100312 <cprintf>
		cprintf("ebp:0x%08x ", current_ebp);
		cprintf("eip:0x%08x ", current_eip);

		cprintf("args:");
		int i = 0;
		for(i = 0; i < 4; i ++)
  100a12:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100a16:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
  100a1a:	7e d4                	jle    1009f0 <print_stackframe+0x60>
			cprintf("0x%08x ", (uint32_t)(*(uint32_t*)(current_ebp + 8 + 4*i)));
		cprintf("\n");
  100a1c:	c7 04 24 8e 36 10 00 	movl   $0x10368e,(%esp)
  100a23:	e8 ea f8 ff ff       	call   100312 <cprintf>

		print_debuginfo(current_eip - sizeof(uint32_t));
  100a28:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a2b:	83 e8 04             	sub    $0x4,%eax
  100a2e:	89 04 24             	mov    %eax,(%esp)
  100a31:	e8 a6 fe ff ff       	call   1008dc <print_debuginfo>

		current_eip = (uint32_t)(*(uint32_t*)(current_ebp + 4));
  100a36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a39:	83 c0 04             	add    $0x4,%eax
  100a3c:	8b 00                	mov    (%eax),%eax
  100a3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
		current_ebp = (uint32_t)(*(uint32_t*)current_ebp);
  100a41:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a44:	8b 00                	mov    (%eax),%eax
  100a46:	89 45 f4             	mov    %eax,-0xc(%ebp)
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t current_ebp = read_ebp();
	uint32_t current_eip = read_eip();

	while(current_ebp != 0)
  100a49:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a4d:	0f 85 5b ff ff ff    	jne    1009ae <print_stackframe+0x1e>

		current_eip = (uint32_t)(*(uint32_t*)(current_ebp + 4));
		current_ebp = (uint32_t)(*(uint32_t*)current_ebp);
	}

	return;
  100a53:	90                   	nop
}
  100a54:	c9                   	leave  
  100a55:	c3                   	ret    

00100a56 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a56:	55                   	push   %ebp
  100a57:	89 e5                	mov    %esp,%ebp
  100a59:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a5c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a63:	eb 0c                	jmp    100a71 <parse+0x1b>
            *buf ++ = '\0';
  100a65:	8b 45 08             	mov    0x8(%ebp),%eax
  100a68:	8d 50 01             	lea    0x1(%eax),%edx
  100a6b:	89 55 08             	mov    %edx,0x8(%ebp)
  100a6e:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a71:	8b 45 08             	mov    0x8(%ebp),%eax
  100a74:	0f b6 00             	movzbl (%eax),%eax
  100a77:	84 c0                	test   %al,%al
  100a79:	74 1d                	je     100a98 <parse+0x42>
  100a7b:	8b 45 08             	mov    0x8(%ebp),%eax
  100a7e:	0f b6 00             	movzbl (%eax),%eax
  100a81:	0f be c0             	movsbl %al,%eax
  100a84:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a88:	c7 04 24 10 37 10 00 	movl   $0x103710,(%esp)
  100a8f:	e8 f5 26 00 00       	call   103189 <strchr>
  100a94:	85 c0                	test   %eax,%eax
  100a96:	75 cd                	jne    100a65 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100a98:	8b 45 08             	mov    0x8(%ebp),%eax
  100a9b:	0f b6 00             	movzbl (%eax),%eax
  100a9e:	84 c0                	test   %al,%al
  100aa0:	75 02                	jne    100aa4 <parse+0x4e>
            break;
  100aa2:	eb 67                	jmp    100b0b <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100aa4:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100aa8:	75 14                	jne    100abe <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100aaa:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100ab1:	00 
  100ab2:	c7 04 24 15 37 10 00 	movl   $0x103715,(%esp)
  100ab9:	e8 54 f8 ff ff       	call   100312 <cprintf>
        }
        argv[argc ++] = buf;
  100abe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ac1:	8d 50 01             	lea    0x1(%eax),%edx
  100ac4:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100ac7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ace:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ad1:	01 c2                	add    %eax,%edx
  100ad3:	8b 45 08             	mov    0x8(%ebp),%eax
  100ad6:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ad8:	eb 04                	jmp    100ade <parse+0x88>
            buf ++;
  100ada:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ade:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae1:	0f b6 00             	movzbl (%eax),%eax
  100ae4:	84 c0                	test   %al,%al
  100ae6:	74 1d                	je     100b05 <parse+0xaf>
  100ae8:	8b 45 08             	mov    0x8(%ebp),%eax
  100aeb:	0f b6 00             	movzbl (%eax),%eax
  100aee:	0f be c0             	movsbl %al,%eax
  100af1:	89 44 24 04          	mov    %eax,0x4(%esp)
  100af5:	c7 04 24 10 37 10 00 	movl   $0x103710,(%esp)
  100afc:	e8 88 26 00 00       	call   103189 <strchr>
  100b01:	85 c0                	test   %eax,%eax
  100b03:	74 d5                	je     100ada <parse+0x84>
            buf ++;
        }
    }
  100b05:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b06:	e9 66 ff ff ff       	jmp    100a71 <parse+0x1b>
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100b0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b0e:	c9                   	leave  
  100b0f:	c3                   	ret    

00100b10 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b10:	55                   	push   %ebp
  100b11:	89 e5                	mov    %esp,%ebp
  100b13:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b16:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b19:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b1d:	8b 45 08             	mov    0x8(%ebp),%eax
  100b20:	89 04 24             	mov    %eax,(%esp)
  100b23:	e8 2e ff ff ff       	call   100a56 <parse>
  100b28:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b2b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b2f:	75 0a                	jne    100b3b <runcmd+0x2b>
        return 0;
  100b31:	b8 00 00 00 00       	mov    $0x0,%eax
  100b36:	e9 85 00 00 00       	jmp    100bc0 <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b3b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b42:	eb 5c                	jmp    100ba0 <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b44:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b47:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b4a:	89 d0                	mov    %edx,%eax
  100b4c:	01 c0                	add    %eax,%eax
  100b4e:	01 d0                	add    %edx,%eax
  100b50:	c1 e0 02             	shl    $0x2,%eax
  100b53:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b58:	8b 00                	mov    (%eax),%eax
  100b5a:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b5e:	89 04 24             	mov    %eax,(%esp)
  100b61:	e8 84 25 00 00       	call   1030ea <strcmp>
  100b66:	85 c0                	test   %eax,%eax
  100b68:	75 32                	jne    100b9c <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b6a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b6d:	89 d0                	mov    %edx,%eax
  100b6f:	01 c0                	add    %eax,%eax
  100b71:	01 d0                	add    %edx,%eax
  100b73:	c1 e0 02             	shl    $0x2,%eax
  100b76:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b7b:	8b 40 08             	mov    0x8(%eax),%eax
  100b7e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100b81:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100b84:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b87:	89 54 24 08          	mov    %edx,0x8(%esp)
  100b8b:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100b8e:	83 c2 04             	add    $0x4,%edx
  100b91:	89 54 24 04          	mov    %edx,0x4(%esp)
  100b95:	89 0c 24             	mov    %ecx,(%esp)
  100b98:	ff d0                	call   *%eax
  100b9a:	eb 24                	jmp    100bc0 <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b9c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100ba0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ba3:	83 f8 02             	cmp    $0x2,%eax
  100ba6:	76 9c                	jbe    100b44 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100ba8:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100bab:	89 44 24 04          	mov    %eax,0x4(%esp)
  100baf:	c7 04 24 33 37 10 00 	movl   $0x103733,(%esp)
  100bb6:	e8 57 f7 ff ff       	call   100312 <cprintf>
    return 0;
  100bbb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bc0:	c9                   	leave  
  100bc1:	c3                   	ret    

00100bc2 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bc2:	55                   	push   %ebp
  100bc3:	89 e5                	mov    %esp,%ebp
  100bc5:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bc8:	c7 04 24 4c 37 10 00 	movl   $0x10374c,(%esp)
  100bcf:	e8 3e f7 ff ff       	call   100312 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bd4:	c7 04 24 74 37 10 00 	movl   $0x103774,(%esp)
  100bdb:	e8 32 f7 ff ff       	call   100312 <cprintf>

    if (tf != NULL) {
  100be0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100be4:	74 0b                	je     100bf1 <kmonitor+0x2f>
        print_trapframe(tf);
  100be6:	8b 45 08             	mov    0x8(%ebp),%eax
  100be9:	89 04 24             	mov    %eax,(%esp)
  100bec:	e8 26 0e 00 00       	call   101a17 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bf1:	c7 04 24 99 37 10 00 	movl   $0x103799,(%esp)
  100bf8:	e8 0c f6 ff ff       	call   100209 <readline>
  100bfd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c00:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c04:	74 18                	je     100c1e <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100c06:	8b 45 08             	mov    0x8(%ebp),%eax
  100c09:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c10:	89 04 24             	mov    %eax,(%esp)
  100c13:	e8 f8 fe ff ff       	call   100b10 <runcmd>
  100c18:	85 c0                	test   %eax,%eax
  100c1a:	79 02                	jns    100c1e <kmonitor+0x5c>
                break;
  100c1c:	eb 02                	jmp    100c20 <kmonitor+0x5e>
            }
        }
    }
  100c1e:	eb d1                	jmp    100bf1 <kmonitor+0x2f>
}
  100c20:	c9                   	leave  
  100c21:	c3                   	ret    

00100c22 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c22:	55                   	push   %ebp
  100c23:	89 e5                	mov    %esp,%ebp
  100c25:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c28:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c2f:	eb 3f                	jmp    100c70 <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c31:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c34:	89 d0                	mov    %edx,%eax
  100c36:	01 c0                	add    %eax,%eax
  100c38:	01 d0                	add    %edx,%eax
  100c3a:	c1 e0 02             	shl    $0x2,%eax
  100c3d:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c42:	8b 48 04             	mov    0x4(%eax),%ecx
  100c45:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c48:	89 d0                	mov    %edx,%eax
  100c4a:	01 c0                	add    %eax,%eax
  100c4c:	01 d0                	add    %edx,%eax
  100c4e:	c1 e0 02             	shl    $0x2,%eax
  100c51:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c56:	8b 00                	mov    (%eax),%eax
  100c58:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c5c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c60:	c7 04 24 9d 37 10 00 	movl   $0x10379d,(%esp)
  100c67:	e8 a6 f6 ff ff       	call   100312 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c6c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c70:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c73:	83 f8 02             	cmp    $0x2,%eax
  100c76:	76 b9                	jbe    100c31 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c78:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c7d:	c9                   	leave  
  100c7e:	c3                   	ret    

00100c7f <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c7f:	55                   	push   %ebp
  100c80:	89 e5                	mov    %esp,%ebp
  100c82:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c85:	e8 bc fb ff ff       	call   100846 <print_kerninfo>
    return 0;
  100c8a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c8f:	c9                   	leave  
  100c90:	c3                   	ret    

00100c91 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c91:	55                   	push   %ebp
  100c92:	89 e5                	mov    %esp,%ebp
  100c94:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c97:	e8 f4 fc ff ff       	call   100990 <print_stackframe>
    return 0;
  100c9c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ca1:	c9                   	leave  
  100ca2:	c3                   	ret    

00100ca3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100ca3:	55                   	push   %ebp
  100ca4:	89 e5                	mov    %esp,%ebp
  100ca6:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100ca9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100cae:	85 c0                	test   %eax,%eax
  100cb0:	74 02                	je     100cb4 <__panic+0x11>
        goto panic_dead;
  100cb2:	eb 48                	jmp    100cfc <__panic+0x59>
    }
    is_panic = 1;
  100cb4:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100cbb:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100cbe:	8d 45 14             	lea    0x14(%ebp),%eax
  100cc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100cc4:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cc7:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ccb:	8b 45 08             	mov    0x8(%ebp),%eax
  100cce:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cd2:	c7 04 24 a6 37 10 00 	movl   $0x1037a6,(%esp)
  100cd9:	e8 34 f6 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100cde:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ce1:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ce5:	8b 45 10             	mov    0x10(%ebp),%eax
  100ce8:	89 04 24             	mov    %eax,(%esp)
  100ceb:	e8 ef f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100cf0:	c7 04 24 c2 37 10 00 	movl   $0x1037c2,(%esp)
  100cf7:	e8 16 f6 ff ff       	call   100312 <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  100cfc:	e8 22 09 00 00       	call   101623 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100d01:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d08:	e8 b5 fe ff ff       	call   100bc2 <kmonitor>
    }
  100d0d:	eb f2                	jmp    100d01 <__panic+0x5e>

00100d0f <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d0f:	55                   	push   %ebp
  100d10:	89 e5                	mov    %esp,%ebp
  100d12:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d15:	8d 45 14             	lea    0x14(%ebp),%eax
  100d18:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d1e:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d22:	8b 45 08             	mov    0x8(%ebp),%eax
  100d25:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d29:	c7 04 24 c4 37 10 00 	movl   $0x1037c4,(%esp)
  100d30:	e8 dd f5 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100d35:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d38:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d3c:	8b 45 10             	mov    0x10(%ebp),%eax
  100d3f:	89 04 24             	mov    %eax,(%esp)
  100d42:	e8 98 f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100d47:	c7 04 24 c2 37 10 00 	movl   $0x1037c2,(%esp)
  100d4e:	e8 bf f5 ff ff       	call   100312 <cprintf>
    va_end(ap);
}
  100d53:	c9                   	leave  
  100d54:	c3                   	ret    

00100d55 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d55:	55                   	push   %ebp
  100d56:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d58:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d5d:	5d                   	pop    %ebp
  100d5e:	c3                   	ret    

00100d5f <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d5f:	55                   	push   %ebp
  100d60:	89 e5                	mov    %esp,%ebp
  100d62:	83 ec 28             	sub    $0x28,%esp
  100d65:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d6b:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d6f:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d73:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d77:	ee                   	out    %al,(%dx)
  100d78:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d7e:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d82:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d86:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d8a:	ee                   	out    %al,(%dx)
  100d8b:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d91:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d95:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d99:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d9d:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d9e:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100da5:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100da8:	c7 04 24 e2 37 10 00 	movl   $0x1037e2,(%esp)
  100daf:	e8 5e f5 ff ff       	call   100312 <cprintf>
    pic_enable(IRQ_TIMER);
  100db4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dbb:	e8 c1 08 00 00       	call   101681 <pic_enable>
}
  100dc0:	c9                   	leave  
  100dc1:	c3                   	ret    

00100dc2 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dc2:	55                   	push   %ebp
  100dc3:	89 e5                	mov    %esp,%ebp
  100dc5:	83 ec 10             	sub    $0x10,%esp
  100dc8:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dce:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100dd2:	89 c2                	mov    %eax,%edx
  100dd4:	ec                   	in     (%dx),%al
  100dd5:	88 45 fd             	mov    %al,-0x3(%ebp)
  100dd8:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dde:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100de2:	89 c2                	mov    %eax,%edx
  100de4:	ec                   	in     (%dx),%al
  100de5:	88 45 f9             	mov    %al,-0x7(%ebp)
  100de8:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100dee:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100df2:	89 c2                	mov    %eax,%edx
  100df4:	ec                   	in     (%dx),%al
  100df5:	88 45 f5             	mov    %al,-0xb(%ebp)
  100df8:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100dfe:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e02:	89 c2                	mov    %eax,%edx
  100e04:	ec                   	in     (%dx),%al
  100e05:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e08:	c9                   	leave  
  100e09:	c3                   	ret    

00100e0a <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100e0a:	55                   	push   %ebp
  100e0b:	89 e5                	mov    %esp,%ebp
  100e0d:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100e10:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;
  100e17:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e1a:	0f b7 00             	movzwl (%eax),%eax
  100e1d:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;
  100e21:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e24:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100e29:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e2c:	0f b7 00             	movzwl (%eax),%eax
  100e2f:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e33:	74 12                	je     100e47 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;
  100e35:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;
  100e3c:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e43:	b4 03 
  100e45:	eb 13                	jmp    100e5a <cga_init+0x50>
    } else {
        *cp = was;
  100e47:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e4a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e4e:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100e51:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e58:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100e5a:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e61:	0f b7 c0             	movzwl %ax,%eax
  100e64:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e68:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e6c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e70:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e74:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100e75:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e7c:	83 c0 01             	add    $0x1,%eax
  100e7f:	0f b7 c0             	movzwl %ax,%eax
  100e82:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e86:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e8a:	89 c2                	mov    %eax,%edx
  100e8c:	ec                   	in     (%dx),%al
  100e8d:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e90:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e94:	0f b6 c0             	movzbl %al,%eax
  100e97:	c1 e0 08             	shl    $0x8,%eax
  100e9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e9d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ea4:	0f b7 c0             	movzwl %ax,%eax
  100ea7:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100eab:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eaf:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100eb3:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100eb7:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100eb8:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ebf:	83 c0 01             	add    $0x1,%eax
  100ec2:	0f b7 c0             	movzwl %ax,%eax
  100ec5:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ec9:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100ecd:	89 c2                	mov    %eax,%edx
  100ecf:	ec                   	in     (%dx),%al
  100ed0:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100ed3:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ed7:	0f b6 c0             	movzbl %al,%eax
  100eda:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;
  100edd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ee0:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;
  100ee5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ee8:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100eee:	c9                   	leave  
  100eef:	c3                   	ret    

00100ef0 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ef0:	55                   	push   %ebp
  100ef1:	89 e5                	mov    %esp,%ebp
  100ef3:	83 ec 48             	sub    $0x48,%esp
  100ef6:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100efc:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f00:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f04:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f08:	ee                   	out    %al,(%dx)
  100f09:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f0f:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f13:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f17:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f1b:	ee                   	out    %al,(%dx)
  100f1c:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f22:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f26:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f2a:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f2e:	ee                   	out    %al,(%dx)
  100f2f:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f35:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f39:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f3d:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f41:	ee                   	out    %al,(%dx)
  100f42:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f48:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f4c:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f50:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f54:	ee                   	out    %al,(%dx)
  100f55:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f5b:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f5f:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f63:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f67:	ee                   	out    %al,(%dx)
  100f68:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f6e:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f72:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f76:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f7a:	ee                   	out    %al,(%dx)
  100f7b:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f81:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f85:	89 c2                	mov    %eax,%edx
  100f87:	ec                   	in     (%dx),%al
  100f88:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f8b:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f8f:	3c ff                	cmp    $0xff,%al
  100f91:	0f 95 c0             	setne  %al
  100f94:	0f b6 c0             	movzbl %al,%eax
  100f97:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f9c:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fa2:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100fa6:	89 c2                	mov    %eax,%edx
  100fa8:	ec                   	in     (%dx),%al
  100fa9:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100fac:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100fb2:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100fb6:	89 c2                	mov    %eax,%edx
  100fb8:	ec                   	in     (%dx),%al
  100fb9:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fbc:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fc1:	85 c0                	test   %eax,%eax
  100fc3:	74 0c                	je     100fd1 <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fc5:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fcc:	e8 b0 06 00 00       	call   101681 <pic_enable>
    }
}
  100fd1:	c9                   	leave  
  100fd2:	c3                   	ret    

00100fd3 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fd3:	55                   	push   %ebp
  100fd4:	89 e5                	mov    %esp,%ebp
  100fd6:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fd9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fe0:	eb 09                	jmp    100feb <lpt_putc_sub+0x18>
        delay();
  100fe2:	e8 db fd ff ff       	call   100dc2 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fe7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100feb:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100ff1:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100ff5:	89 c2                	mov    %eax,%edx
  100ff7:	ec                   	in     (%dx),%al
  100ff8:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100ffb:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100fff:	84 c0                	test   %al,%al
  101001:	78 09                	js     10100c <lpt_putc_sub+0x39>
  101003:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10100a:	7e d6                	jle    100fe2 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  10100c:	8b 45 08             	mov    0x8(%ebp),%eax
  10100f:	0f b6 c0             	movzbl %al,%eax
  101012:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  101018:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10101b:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10101f:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101023:	ee                   	out    %al,(%dx)
  101024:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  10102a:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  10102e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101032:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101036:	ee                   	out    %al,(%dx)
  101037:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  10103d:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  101041:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101045:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101049:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10104a:	c9                   	leave  
  10104b:	c3                   	ret    

0010104c <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10104c:	55                   	push   %ebp
  10104d:	89 e5                	mov    %esp,%ebp
  10104f:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101052:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101056:	74 0d                	je     101065 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101058:	8b 45 08             	mov    0x8(%ebp),%eax
  10105b:	89 04 24             	mov    %eax,(%esp)
  10105e:	e8 70 ff ff ff       	call   100fd3 <lpt_putc_sub>
  101063:	eb 24                	jmp    101089 <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  101065:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10106c:	e8 62 ff ff ff       	call   100fd3 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101071:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101078:	e8 56 ff ff ff       	call   100fd3 <lpt_putc_sub>
        lpt_putc_sub('\b');
  10107d:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101084:	e8 4a ff ff ff       	call   100fd3 <lpt_putc_sub>
    }
}
  101089:	c9                   	leave  
  10108a:	c3                   	ret    

0010108b <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10108b:	55                   	push   %ebp
  10108c:	89 e5                	mov    %esp,%ebp
  10108e:	53                   	push   %ebx
  10108f:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101092:	8b 45 08             	mov    0x8(%ebp),%eax
  101095:	b0 00                	mov    $0x0,%al
  101097:	85 c0                	test   %eax,%eax
  101099:	75 07                	jne    1010a2 <cga_putc+0x17>
        c |= 0x0700;
  10109b:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a5:	0f b6 c0             	movzbl %al,%eax
  1010a8:	83 f8 0a             	cmp    $0xa,%eax
  1010ab:	74 4c                	je     1010f9 <cga_putc+0x6e>
  1010ad:	83 f8 0d             	cmp    $0xd,%eax
  1010b0:	74 57                	je     101109 <cga_putc+0x7e>
  1010b2:	83 f8 08             	cmp    $0x8,%eax
  1010b5:	0f 85 88 00 00 00    	jne    101143 <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  1010bb:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010c2:	66 85 c0             	test   %ax,%ax
  1010c5:	74 30                	je     1010f7 <cga_putc+0x6c>
            crt_pos --;
  1010c7:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010ce:	83 e8 01             	sub    $0x1,%eax
  1010d1:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010d7:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010dc:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010e3:	0f b7 d2             	movzwl %dx,%edx
  1010e6:	01 d2                	add    %edx,%edx
  1010e8:	01 c2                	add    %eax,%edx
  1010ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1010ed:	b0 00                	mov    $0x0,%al
  1010ef:	83 c8 20             	or     $0x20,%eax
  1010f2:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010f5:	eb 72                	jmp    101169 <cga_putc+0xde>
  1010f7:	eb 70                	jmp    101169 <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  1010f9:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101100:	83 c0 50             	add    $0x50,%eax
  101103:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101109:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  101110:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101117:	0f b7 c1             	movzwl %cx,%eax
  10111a:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  101120:	c1 e8 10             	shr    $0x10,%eax
  101123:	89 c2                	mov    %eax,%edx
  101125:	66 c1 ea 06          	shr    $0x6,%dx
  101129:	89 d0                	mov    %edx,%eax
  10112b:	c1 e0 02             	shl    $0x2,%eax
  10112e:	01 d0                	add    %edx,%eax
  101130:	c1 e0 04             	shl    $0x4,%eax
  101133:	29 c1                	sub    %eax,%ecx
  101135:	89 ca                	mov    %ecx,%edx
  101137:	89 d8                	mov    %ebx,%eax
  101139:	29 d0                	sub    %edx,%eax
  10113b:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101141:	eb 26                	jmp    101169 <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101143:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101149:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101150:	8d 50 01             	lea    0x1(%eax),%edx
  101153:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  10115a:	0f b7 c0             	movzwl %ax,%eax
  10115d:	01 c0                	add    %eax,%eax
  10115f:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101162:	8b 45 08             	mov    0x8(%ebp),%eax
  101165:	66 89 02             	mov    %ax,(%edx)
        break;
  101168:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101169:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101170:	66 3d cf 07          	cmp    $0x7cf,%ax
  101174:	76 5b                	jbe    1011d1 <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101176:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10117b:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101181:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101186:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  10118d:	00 
  10118e:	89 54 24 04          	mov    %edx,0x4(%esp)
  101192:	89 04 24             	mov    %eax,(%esp)
  101195:	e8 ed 21 00 00       	call   103387 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10119a:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011a1:	eb 15                	jmp    1011b8 <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  1011a3:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011ab:	01 d2                	add    %edx,%edx
  1011ad:	01 d0                	add    %edx,%eax
  1011af:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011b8:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011bf:	7e e2                	jle    1011a3 <cga_putc+0x118>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011c1:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011c8:	83 e8 50             	sub    $0x50,%eax
  1011cb:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011d1:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011d8:	0f b7 c0             	movzwl %ax,%eax
  1011db:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011df:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011e3:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011e7:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011eb:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011ec:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011f3:	66 c1 e8 08          	shr    $0x8,%ax
  1011f7:	0f b6 c0             	movzbl %al,%eax
  1011fa:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101201:	83 c2 01             	add    $0x1,%edx
  101204:	0f b7 d2             	movzwl %dx,%edx
  101207:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  10120b:	88 45 ed             	mov    %al,-0x13(%ebp)
  10120e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101212:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101216:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101217:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10121e:	0f b7 c0             	movzwl %ax,%eax
  101221:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101225:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  101229:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10122d:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101231:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101232:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101239:	0f b6 c0             	movzbl %al,%eax
  10123c:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101243:	83 c2 01             	add    $0x1,%edx
  101246:	0f b7 d2             	movzwl %dx,%edx
  101249:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  10124d:	88 45 e5             	mov    %al,-0x1b(%ebp)
  101250:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101254:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101258:	ee                   	out    %al,(%dx)
}
  101259:	83 c4 34             	add    $0x34,%esp
  10125c:	5b                   	pop    %ebx
  10125d:	5d                   	pop    %ebp
  10125e:	c3                   	ret    

0010125f <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10125f:	55                   	push   %ebp
  101260:	89 e5                	mov    %esp,%ebp
  101262:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101265:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10126c:	eb 09                	jmp    101277 <serial_putc_sub+0x18>
        delay();
  10126e:	e8 4f fb ff ff       	call   100dc2 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101273:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101277:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10127d:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101281:	89 c2                	mov    %eax,%edx
  101283:	ec                   	in     (%dx),%al
  101284:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101287:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10128b:	0f b6 c0             	movzbl %al,%eax
  10128e:	83 e0 20             	and    $0x20,%eax
  101291:	85 c0                	test   %eax,%eax
  101293:	75 09                	jne    10129e <serial_putc_sub+0x3f>
  101295:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10129c:	7e d0                	jle    10126e <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  10129e:	8b 45 08             	mov    0x8(%ebp),%eax
  1012a1:	0f b6 c0             	movzbl %al,%eax
  1012a4:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012aa:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012ad:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012b1:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012b5:	ee                   	out    %al,(%dx)
}
  1012b6:	c9                   	leave  
  1012b7:	c3                   	ret    

001012b8 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012b8:	55                   	push   %ebp
  1012b9:	89 e5                	mov    %esp,%ebp
  1012bb:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012be:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012c2:	74 0d                	je     1012d1 <serial_putc+0x19>
        serial_putc_sub(c);
  1012c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1012c7:	89 04 24             	mov    %eax,(%esp)
  1012ca:	e8 90 ff ff ff       	call   10125f <serial_putc_sub>
  1012cf:	eb 24                	jmp    1012f5 <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  1012d1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012d8:	e8 82 ff ff ff       	call   10125f <serial_putc_sub>
        serial_putc_sub(' ');
  1012dd:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012e4:	e8 76 ff ff ff       	call   10125f <serial_putc_sub>
        serial_putc_sub('\b');
  1012e9:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012f0:	e8 6a ff ff ff       	call   10125f <serial_putc_sub>
    }
}
  1012f5:	c9                   	leave  
  1012f6:	c3                   	ret    

001012f7 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012f7:	55                   	push   %ebp
  1012f8:	89 e5                	mov    %esp,%ebp
  1012fa:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012fd:	eb 33                	jmp    101332 <cons_intr+0x3b>
        if (c != 0) {
  1012ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101303:	74 2d                	je     101332 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101305:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10130a:	8d 50 01             	lea    0x1(%eax),%edx
  10130d:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101313:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101316:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  10131c:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101321:	3d 00 02 00 00       	cmp    $0x200,%eax
  101326:	75 0a                	jne    101332 <cons_intr+0x3b>
                cons.wpos = 0;
  101328:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  10132f:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101332:	8b 45 08             	mov    0x8(%ebp),%eax
  101335:	ff d0                	call   *%eax
  101337:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10133a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10133e:	75 bf                	jne    1012ff <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  101340:	c9                   	leave  
  101341:	c3                   	ret    

00101342 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101342:	55                   	push   %ebp
  101343:	89 e5                	mov    %esp,%ebp
  101345:	83 ec 10             	sub    $0x10,%esp
  101348:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10134e:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101352:	89 c2                	mov    %eax,%edx
  101354:	ec                   	in     (%dx),%al
  101355:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101358:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10135c:	0f b6 c0             	movzbl %al,%eax
  10135f:	83 e0 01             	and    $0x1,%eax
  101362:	85 c0                	test   %eax,%eax
  101364:	75 07                	jne    10136d <serial_proc_data+0x2b>
        return -1;
  101366:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10136b:	eb 2a                	jmp    101397 <serial_proc_data+0x55>
  10136d:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101373:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101377:	89 c2                	mov    %eax,%edx
  101379:	ec                   	in     (%dx),%al
  10137a:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  10137d:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101381:	0f b6 c0             	movzbl %al,%eax
  101384:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101387:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10138b:	75 07                	jne    101394 <serial_proc_data+0x52>
        c = '\b';
  10138d:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101394:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101397:	c9                   	leave  
  101398:	c3                   	ret    

00101399 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101399:	55                   	push   %ebp
  10139a:	89 e5                	mov    %esp,%ebp
  10139c:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10139f:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013a4:	85 c0                	test   %eax,%eax
  1013a6:	74 0c                	je     1013b4 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013a8:	c7 04 24 42 13 10 00 	movl   $0x101342,(%esp)
  1013af:	e8 43 ff ff ff       	call   1012f7 <cons_intr>
    }
}
  1013b4:	c9                   	leave  
  1013b5:	c3                   	ret    

001013b6 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013b6:	55                   	push   %ebp
  1013b7:	89 e5                	mov    %esp,%ebp
  1013b9:	83 ec 38             	sub    $0x38,%esp
  1013bc:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013c2:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013c6:	89 c2                	mov    %eax,%edx
  1013c8:	ec                   	in     (%dx),%al
  1013c9:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013cc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013d0:	0f b6 c0             	movzbl %al,%eax
  1013d3:	83 e0 01             	and    $0x1,%eax
  1013d6:	85 c0                	test   %eax,%eax
  1013d8:	75 0a                	jne    1013e4 <kbd_proc_data+0x2e>
        return -1;
  1013da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013df:	e9 59 01 00 00       	jmp    10153d <kbd_proc_data+0x187>
  1013e4:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013ea:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013ee:	89 c2                	mov    %eax,%edx
  1013f0:	ec                   	in     (%dx),%al
  1013f1:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013f4:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013f8:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013fb:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013ff:	75 17                	jne    101418 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  101401:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101406:	83 c8 40             	or     $0x40,%eax
  101409:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10140e:	b8 00 00 00 00       	mov    $0x0,%eax
  101413:	e9 25 01 00 00       	jmp    10153d <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  101418:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10141c:	84 c0                	test   %al,%al
  10141e:	79 47                	jns    101467 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101420:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101425:	83 e0 40             	and    $0x40,%eax
  101428:	85 c0                	test   %eax,%eax
  10142a:	75 09                	jne    101435 <kbd_proc_data+0x7f>
  10142c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101430:	83 e0 7f             	and    $0x7f,%eax
  101433:	eb 04                	jmp    101439 <kbd_proc_data+0x83>
  101435:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101439:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10143c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101440:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101447:	83 c8 40             	or     $0x40,%eax
  10144a:	0f b6 c0             	movzbl %al,%eax
  10144d:	f7 d0                	not    %eax
  10144f:	89 c2                	mov    %eax,%edx
  101451:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101456:	21 d0                	and    %edx,%eax
  101458:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10145d:	b8 00 00 00 00       	mov    $0x0,%eax
  101462:	e9 d6 00 00 00       	jmp    10153d <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101467:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10146c:	83 e0 40             	and    $0x40,%eax
  10146f:	85 c0                	test   %eax,%eax
  101471:	74 11                	je     101484 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101473:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101477:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10147c:	83 e0 bf             	and    $0xffffffbf,%eax
  10147f:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101484:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101488:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10148f:	0f b6 d0             	movzbl %al,%edx
  101492:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101497:	09 d0                	or     %edx,%eax
  101499:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  10149e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014a2:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014a9:	0f b6 d0             	movzbl %al,%edx
  1014ac:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b1:	31 d0                	xor    %edx,%eax
  1014b3:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014b8:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014bd:	83 e0 03             	and    $0x3,%eax
  1014c0:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014c7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014cb:	01 d0                	add    %edx,%eax
  1014cd:	0f b6 00             	movzbl (%eax),%eax
  1014d0:	0f b6 c0             	movzbl %al,%eax
  1014d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014d6:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014db:	83 e0 08             	and    $0x8,%eax
  1014de:	85 c0                	test   %eax,%eax
  1014e0:	74 22                	je     101504 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014e2:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014e6:	7e 0c                	jle    1014f4 <kbd_proc_data+0x13e>
  1014e8:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014ec:	7f 06                	jg     1014f4 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014ee:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014f2:	eb 10                	jmp    101504 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014f4:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014f8:	7e 0a                	jle    101504 <kbd_proc_data+0x14e>
  1014fa:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014fe:	7f 04                	jg     101504 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  101500:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101504:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101509:	f7 d0                	not    %eax
  10150b:	83 e0 06             	and    $0x6,%eax
  10150e:	85 c0                	test   %eax,%eax
  101510:	75 28                	jne    10153a <kbd_proc_data+0x184>
  101512:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101519:	75 1f                	jne    10153a <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  10151b:	c7 04 24 fd 37 10 00 	movl   $0x1037fd,(%esp)
  101522:	e8 eb ed ff ff       	call   100312 <cprintf>
  101527:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  10152d:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101531:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101535:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101539:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10153a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10153d:	c9                   	leave  
  10153e:	c3                   	ret    

0010153f <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10153f:	55                   	push   %ebp
  101540:	89 e5                	mov    %esp,%ebp
  101542:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101545:	c7 04 24 b6 13 10 00 	movl   $0x1013b6,(%esp)
  10154c:	e8 a6 fd ff ff       	call   1012f7 <cons_intr>
}
  101551:	c9                   	leave  
  101552:	c3                   	ret    

00101553 <kbd_init>:

static void
kbd_init(void) {
  101553:	55                   	push   %ebp
  101554:	89 e5                	mov    %esp,%ebp
  101556:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101559:	e8 e1 ff ff ff       	call   10153f <kbd_intr>
    pic_enable(IRQ_KBD);
  10155e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101565:	e8 17 01 00 00       	call   101681 <pic_enable>
}
  10156a:	c9                   	leave  
  10156b:	c3                   	ret    

0010156c <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10156c:	55                   	push   %ebp
  10156d:	89 e5                	mov    %esp,%ebp
  10156f:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101572:	e8 93 f8 ff ff       	call   100e0a <cga_init>
    serial_init();
  101577:	e8 74 f9 ff ff       	call   100ef0 <serial_init>
    kbd_init();
  10157c:	e8 d2 ff ff ff       	call   101553 <kbd_init>
    if (!serial_exists) {
  101581:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101586:	85 c0                	test   %eax,%eax
  101588:	75 0c                	jne    101596 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  10158a:	c7 04 24 09 38 10 00 	movl   $0x103809,(%esp)
  101591:	e8 7c ed ff ff       	call   100312 <cprintf>
    }
}
  101596:	c9                   	leave  
  101597:	c3                   	ret    

00101598 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101598:	55                   	push   %ebp
  101599:	89 e5                	mov    %esp,%ebp
  10159b:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  10159e:	8b 45 08             	mov    0x8(%ebp),%eax
  1015a1:	89 04 24             	mov    %eax,(%esp)
  1015a4:	e8 a3 fa ff ff       	call   10104c <lpt_putc>
    cga_putc(c);
  1015a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1015ac:	89 04 24             	mov    %eax,(%esp)
  1015af:	e8 d7 fa ff ff       	call   10108b <cga_putc>
    serial_putc(c);
  1015b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b7:	89 04 24             	mov    %eax,(%esp)
  1015ba:	e8 f9 fc ff ff       	call   1012b8 <serial_putc>
}
  1015bf:	c9                   	leave  
  1015c0:	c3                   	ret    

001015c1 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015c1:	55                   	push   %ebp
  1015c2:	89 e5                	mov    %esp,%ebp
  1015c4:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015c7:	e8 cd fd ff ff       	call   101399 <serial_intr>
    kbd_intr();
  1015cc:	e8 6e ff ff ff       	call   10153f <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015d1:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015d7:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015dc:	39 c2                	cmp    %eax,%edx
  1015de:	74 36                	je     101616 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015e0:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015e5:	8d 50 01             	lea    0x1(%eax),%edx
  1015e8:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015ee:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015f5:	0f b6 c0             	movzbl %al,%eax
  1015f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015fb:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101600:	3d 00 02 00 00       	cmp    $0x200,%eax
  101605:	75 0a                	jne    101611 <cons_getc+0x50>
            cons.rpos = 0;
  101607:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10160e:	00 00 00 
        }
        return c;
  101611:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101614:	eb 05                	jmp    10161b <cons_getc+0x5a>
    }
    return 0;
  101616:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10161b:	c9                   	leave  
  10161c:	c3                   	ret    

0010161d <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  10161d:	55                   	push   %ebp
  10161e:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101620:	fb                   	sti    
    sti();
}
  101621:	5d                   	pop    %ebp
  101622:	c3                   	ret    

00101623 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101623:	55                   	push   %ebp
  101624:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101626:	fa                   	cli    
    cli();
}
  101627:	5d                   	pop    %ebp
  101628:	c3                   	ret    

00101629 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101629:	55                   	push   %ebp
  10162a:	89 e5                	mov    %esp,%ebp
  10162c:	83 ec 14             	sub    $0x14,%esp
  10162f:	8b 45 08             	mov    0x8(%ebp),%eax
  101632:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101636:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10163a:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101640:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101645:	85 c0                	test   %eax,%eax
  101647:	74 36                	je     10167f <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101649:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10164d:	0f b6 c0             	movzbl %al,%eax
  101650:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101656:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101659:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10165d:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101661:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101662:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101666:	66 c1 e8 08          	shr    $0x8,%ax
  10166a:	0f b6 c0             	movzbl %al,%eax
  10166d:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101673:	88 45 f9             	mov    %al,-0x7(%ebp)
  101676:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10167a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10167e:	ee                   	out    %al,(%dx)
    }
}
  10167f:	c9                   	leave  
  101680:	c3                   	ret    

00101681 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101681:	55                   	push   %ebp
  101682:	89 e5                	mov    %esp,%ebp
  101684:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101687:	8b 45 08             	mov    0x8(%ebp),%eax
  10168a:	ba 01 00 00 00       	mov    $0x1,%edx
  10168f:	89 c1                	mov    %eax,%ecx
  101691:	d3 e2                	shl    %cl,%edx
  101693:	89 d0                	mov    %edx,%eax
  101695:	f7 d0                	not    %eax
  101697:	89 c2                	mov    %eax,%edx
  101699:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1016a0:	21 d0                	and    %edx,%eax
  1016a2:	0f b7 c0             	movzwl %ax,%eax
  1016a5:	89 04 24             	mov    %eax,(%esp)
  1016a8:	e8 7c ff ff ff       	call   101629 <pic_setmask>
}
  1016ad:	c9                   	leave  
  1016ae:	c3                   	ret    

001016af <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016af:	55                   	push   %ebp
  1016b0:	89 e5                	mov    %esp,%ebp
  1016b2:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016b5:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016bc:	00 00 00 
  1016bf:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016c5:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  1016c9:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016cd:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016d1:	ee                   	out    %al,(%dx)
  1016d2:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016d8:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  1016dc:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016e0:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016e4:	ee                   	out    %al,(%dx)
  1016e5:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016eb:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016ef:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016f3:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016f7:	ee                   	out    %al,(%dx)
  1016f8:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  1016fe:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  101702:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101706:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10170a:	ee                   	out    %al,(%dx)
  10170b:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  101711:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101715:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101719:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10171d:	ee                   	out    %al,(%dx)
  10171e:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101724:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  101728:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10172c:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101730:	ee                   	out    %al,(%dx)
  101731:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101737:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  10173b:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10173f:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101743:	ee                   	out    %al,(%dx)
  101744:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  10174a:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  10174e:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101752:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101756:	ee                   	out    %al,(%dx)
  101757:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  10175d:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  101761:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101765:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101769:	ee                   	out    %al,(%dx)
  10176a:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  101770:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101774:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101778:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10177c:	ee                   	out    %al,(%dx)
  10177d:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  101783:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  101787:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10178b:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10178f:	ee                   	out    %al,(%dx)
  101790:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101796:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  10179a:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  10179e:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017a2:	ee                   	out    %al,(%dx)
  1017a3:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  1017a9:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  1017ad:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017b1:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017b5:	ee                   	out    %al,(%dx)
  1017b6:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1017bc:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1017c0:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017c4:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017c8:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017c9:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017d0:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017d4:	74 12                	je     1017e8 <pic_init+0x139>
        pic_setmask(irq_mask);
  1017d6:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017dd:	0f b7 c0             	movzwl %ax,%eax
  1017e0:	89 04 24             	mov    %eax,(%esp)
  1017e3:	e8 41 fe ff ff       	call   101629 <pic_setmask>
    }
}
  1017e8:	c9                   	leave  
  1017e9:	c3                   	ret    

001017ea <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017ea:	55                   	push   %ebp
  1017eb:	89 e5                	mov    %esp,%ebp
  1017ed:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017f0:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1017f7:	00 
  1017f8:	c7 04 24 40 38 10 00 	movl   $0x103840,(%esp)
  1017ff:	e8 0e eb ff ff       	call   100312 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101804:	c9                   	leave  
  101805:	c3                   	ret    

00101806 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101806:	55                   	push   %ebp
  101807:	89 e5                	mov    %esp,%ebp
  101809:	83 ec 10             	sub    $0x10,%esp
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	int i = 0;
  10180c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	for(i = 0; i < 256; i ++)
  101813:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10181a:	e9 94 01 00 00       	jmp    1019b3 <idt_init+0x1ad>
	{
		if(i != T_SYSCALL)
  10181f:	81 7d fc 80 00 00 00 	cmpl   $0x80,-0x4(%ebp)
  101826:	0f 84 c4 00 00 00    	je     1018f0 <idt_init+0xea>
		{
			SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  10182c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10182f:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101836:	89 c2                	mov    %eax,%edx
  101838:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10183b:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  101842:	00 
  101843:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101846:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  10184d:	00 08 00 
  101850:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101853:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10185a:	00 
  10185b:	83 e2 e0             	and    $0xffffffe0,%edx
  10185e:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101865:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101868:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10186f:	00 
  101870:	83 e2 1f             	and    $0x1f,%edx
  101873:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10187a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10187d:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101884:	00 
  101885:	83 e2 f0             	and    $0xfffffff0,%edx
  101888:	83 ca 0e             	or     $0xe,%edx
  10188b:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101892:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101895:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10189c:	00 
  10189d:	83 e2 ef             	and    $0xffffffef,%edx
  1018a0:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018aa:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018b1:	00 
  1018b2:	83 e2 9f             	and    $0xffffff9f,%edx
  1018b5:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018bf:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018c6:	00 
  1018c7:	83 ca 80             	or     $0xffffff80,%edx
  1018ca:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d4:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018db:	c1 e8 10             	shr    $0x10,%eax
  1018de:	89 c2                	mov    %eax,%edx
  1018e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018e3:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018ea:	00 
  1018eb:	e9 bf 00 00 00       	jmp    1019af <idt_init+0x1a9>
		}
		else
		{
			SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_USER);
  1018f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018f3:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018fa:	89 c2                	mov    %eax,%edx
  1018fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ff:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  101906:	00 
  101907:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10190a:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101911:	00 08 00 
  101914:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101917:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10191e:	00 
  10191f:	83 e2 e0             	and    $0xffffffe0,%edx
  101922:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101929:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10192c:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101933:	00 
  101934:	83 e2 1f             	and    $0x1f,%edx
  101937:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10193e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101941:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101948:	00 
  101949:	83 e2 f0             	and    $0xfffffff0,%edx
  10194c:	83 ca 0e             	or     $0xe,%edx
  10194f:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101956:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101959:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101960:	00 
  101961:	83 e2 ef             	and    $0xffffffef,%edx
  101964:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10196b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10196e:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101975:	00 
  101976:	83 ca 60             	or     $0x60,%edx
  101979:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101980:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101983:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10198a:	00 
  10198b:	83 ca 80             	or     $0xffffff80,%edx
  10198e:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101995:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101998:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10199f:	c1 e8 10             	shr    $0x10,%eax
  1019a2:	89 c2                	mov    %eax,%edx
  1019a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019a7:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1019ae:	00 
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	int i = 0;
	for(i = 0; i < 256; i ++)
  1019af:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1019b3:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  1019ba:	0f 8e 5f fe ff ff    	jle    10181f <idt_init+0x19>
  1019c0:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  1019c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1019ca:	0f 01 18             	lidtl  (%eax)
		}
	}

	lidt(&idt_pd);

	return;
  1019cd:	90                   	nop
}
  1019ce:	c9                   	leave  
  1019cf:	c3                   	ret    

001019d0 <trapname>:

static const char *
trapname(int trapno) {
  1019d0:	55                   	push   %ebp
  1019d1:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1019d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d6:	83 f8 13             	cmp    $0x13,%eax
  1019d9:	77 0c                	ja     1019e7 <trapname+0x17>
        return excnames[trapno];
  1019db:	8b 45 08             	mov    0x8(%ebp),%eax
  1019de:	8b 04 85 a0 3b 10 00 	mov    0x103ba0(,%eax,4),%eax
  1019e5:	eb 18                	jmp    1019ff <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1019e7:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019eb:	7e 0d                	jle    1019fa <trapname+0x2a>
  1019ed:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019f1:	7f 07                	jg     1019fa <trapname+0x2a>
        return "Hardware Interrupt";
  1019f3:	b8 4a 38 10 00       	mov    $0x10384a,%eax
  1019f8:	eb 05                	jmp    1019ff <trapname+0x2f>
    }
    return "(unknown trap)";
  1019fa:	b8 5d 38 10 00       	mov    $0x10385d,%eax
}
  1019ff:	5d                   	pop    %ebp
  101a00:	c3                   	ret    

00101a01 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101a01:	55                   	push   %ebp
  101a02:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101a04:	8b 45 08             	mov    0x8(%ebp),%eax
  101a07:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a0b:	66 83 f8 08          	cmp    $0x8,%ax
  101a0f:	0f 94 c0             	sete   %al
  101a12:	0f b6 c0             	movzbl %al,%eax
}
  101a15:	5d                   	pop    %ebp
  101a16:	c3                   	ret    

00101a17 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101a17:	55                   	push   %ebp
  101a18:	89 e5                	mov    %esp,%ebp
  101a1a:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101a1d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a20:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a24:	c7 04 24 9e 38 10 00 	movl   $0x10389e,(%esp)
  101a2b:	e8 e2 e8 ff ff       	call   100312 <cprintf>
    print_regs(&tf->tf_regs);
  101a30:	8b 45 08             	mov    0x8(%ebp),%eax
  101a33:	89 04 24             	mov    %eax,(%esp)
  101a36:	e8 a1 01 00 00       	call   101bdc <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a3b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a3e:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a42:	0f b7 c0             	movzwl %ax,%eax
  101a45:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a49:	c7 04 24 af 38 10 00 	movl   $0x1038af,(%esp)
  101a50:	e8 bd e8 ff ff       	call   100312 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a55:	8b 45 08             	mov    0x8(%ebp),%eax
  101a58:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a5c:	0f b7 c0             	movzwl %ax,%eax
  101a5f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a63:	c7 04 24 c2 38 10 00 	movl   $0x1038c2,(%esp)
  101a6a:	e8 a3 e8 ff ff       	call   100312 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a6f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a72:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a76:	0f b7 c0             	movzwl %ax,%eax
  101a79:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a7d:	c7 04 24 d5 38 10 00 	movl   $0x1038d5,(%esp)
  101a84:	e8 89 e8 ff ff       	call   100312 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a89:	8b 45 08             	mov    0x8(%ebp),%eax
  101a8c:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a90:	0f b7 c0             	movzwl %ax,%eax
  101a93:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a97:	c7 04 24 e8 38 10 00 	movl   $0x1038e8,(%esp)
  101a9e:	e8 6f e8 ff ff       	call   100312 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101aa3:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa6:	8b 40 30             	mov    0x30(%eax),%eax
  101aa9:	89 04 24             	mov    %eax,(%esp)
  101aac:	e8 1f ff ff ff       	call   1019d0 <trapname>
  101ab1:	8b 55 08             	mov    0x8(%ebp),%edx
  101ab4:	8b 52 30             	mov    0x30(%edx),%edx
  101ab7:	89 44 24 08          	mov    %eax,0x8(%esp)
  101abb:	89 54 24 04          	mov    %edx,0x4(%esp)
  101abf:	c7 04 24 fb 38 10 00 	movl   $0x1038fb,(%esp)
  101ac6:	e8 47 e8 ff ff       	call   100312 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101acb:	8b 45 08             	mov    0x8(%ebp),%eax
  101ace:	8b 40 34             	mov    0x34(%eax),%eax
  101ad1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ad5:	c7 04 24 0d 39 10 00 	movl   $0x10390d,(%esp)
  101adc:	e8 31 e8 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101ae1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae4:	8b 40 38             	mov    0x38(%eax),%eax
  101ae7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aeb:	c7 04 24 1c 39 10 00 	movl   $0x10391c,(%esp)
  101af2:	e8 1b e8 ff ff       	call   100312 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101af7:	8b 45 08             	mov    0x8(%ebp),%eax
  101afa:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101afe:	0f b7 c0             	movzwl %ax,%eax
  101b01:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b05:	c7 04 24 2b 39 10 00 	movl   $0x10392b,(%esp)
  101b0c:	e8 01 e8 ff ff       	call   100312 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101b11:	8b 45 08             	mov    0x8(%ebp),%eax
  101b14:	8b 40 40             	mov    0x40(%eax),%eax
  101b17:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b1b:	c7 04 24 3e 39 10 00 	movl   $0x10393e,(%esp)
  101b22:	e8 eb e7 ff ff       	call   100312 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b27:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b2e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b35:	eb 3e                	jmp    101b75 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b37:	8b 45 08             	mov    0x8(%ebp),%eax
  101b3a:	8b 50 40             	mov    0x40(%eax),%edx
  101b3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b40:	21 d0                	and    %edx,%eax
  101b42:	85 c0                	test   %eax,%eax
  101b44:	74 28                	je     101b6e <print_trapframe+0x157>
  101b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b49:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b50:	85 c0                	test   %eax,%eax
  101b52:	74 1a                	je     101b6e <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101b54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b57:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b5e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b62:	c7 04 24 4d 39 10 00 	movl   $0x10394d,(%esp)
  101b69:	e8 a4 e7 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b6e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101b72:	d1 65 f0             	shll   -0x10(%ebp)
  101b75:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b78:	83 f8 17             	cmp    $0x17,%eax
  101b7b:	76 ba                	jbe    101b37 <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b7d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b80:	8b 40 40             	mov    0x40(%eax),%eax
  101b83:	25 00 30 00 00       	and    $0x3000,%eax
  101b88:	c1 e8 0c             	shr    $0xc,%eax
  101b8b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b8f:	c7 04 24 51 39 10 00 	movl   $0x103951,(%esp)
  101b96:	e8 77 e7 ff ff       	call   100312 <cprintf>

    if (!trap_in_kernel(tf)) {
  101b9b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b9e:	89 04 24             	mov    %eax,(%esp)
  101ba1:	e8 5b fe ff ff       	call   101a01 <trap_in_kernel>
  101ba6:	85 c0                	test   %eax,%eax
  101ba8:	75 30                	jne    101bda <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101baa:	8b 45 08             	mov    0x8(%ebp),%eax
  101bad:	8b 40 44             	mov    0x44(%eax),%eax
  101bb0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb4:	c7 04 24 5a 39 10 00 	movl   $0x10395a,(%esp)
  101bbb:	e8 52 e7 ff ff       	call   100312 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101bc0:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc3:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101bc7:	0f b7 c0             	movzwl %ax,%eax
  101bca:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bce:	c7 04 24 69 39 10 00 	movl   $0x103969,(%esp)
  101bd5:	e8 38 e7 ff ff       	call   100312 <cprintf>
    }
}
  101bda:	c9                   	leave  
  101bdb:	c3                   	ret    

00101bdc <print_regs>:

void
print_regs(struct pushregs *regs) {
  101bdc:	55                   	push   %ebp
  101bdd:	89 e5                	mov    %esp,%ebp
  101bdf:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101be2:	8b 45 08             	mov    0x8(%ebp),%eax
  101be5:	8b 00                	mov    (%eax),%eax
  101be7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101beb:	c7 04 24 7c 39 10 00 	movl   $0x10397c,(%esp)
  101bf2:	e8 1b e7 ff ff       	call   100312 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101bf7:	8b 45 08             	mov    0x8(%ebp),%eax
  101bfa:	8b 40 04             	mov    0x4(%eax),%eax
  101bfd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c01:	c7 04 24 8b 39 10 00 	movl   $0x10398b,(%esp)
  101c08:	e8 05 e7 ff ff       	call   100312 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101c0d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c10:	8b 40 08             	mov    0x8(%eax),%eax
  101c13:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c17:	c7 04 24 9a 39 10 00 	movl   $0x10399a,(%esp)
  101c1e:	e8 ef e6 ff ff       	call   100312 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101c23:	8b 45 08             	mov    0x8(%ebp),%eax
  101c26:	8b 40 0c             	mov    0xc(%eax),%eax
  101c29:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c2d:	c7 04 24 a9 39 10 00 	movl   $0x1039a9,(%esp)
  101c34:	e8 d9 e6 ff ff       	call   100312 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c39:	8b 45 08             	mov    0x8(%ebp),%eax
  101c3c:	8b 40 10             	mov    0x10(%eax),%eax
  101c3f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c43:	c7 04 24 b8 39 10 00 	movl   $0x1039b8,(%esp)
  101c4a:	e8 c3 e6 ff ff       	call   100312 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c4f:	8b 45 08             	mov    0x8(%ebp),%eax
  101c52:	8b 40 14             	mov    0x14(%eax),%eax
  101c55:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c59:	c7 04 24 c7 39 10 00 	movl   $0x1039c7,(%esp)
  101c60:	e8 ad e6 ff ff       	call   100312 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c65:	8b 45 08             	mov    0x8(%ebp),%eax
  101c68:	8b 40 18             	mov    0x18(%eax),%eax
  101c6b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c6f:	c7 04 24 d6 39 10 00 	movl   $0x1039d6,(%esp)
  101c76:	e8 97 e6 ff ff       	call   100312 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c7b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c7e:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c81:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c85:	c7 04 24 e5 39 10 00 	movl   $0x1039e5,(%esp)
  101c8c:	e8 81 e6 ff ff       	call   100312 <cprintf>
}
  101c91:	c9                   	leave  
  101c92:	c3                   	ret    

00101c93 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c93:	55                   	push   %ebp
  101c94:	89 e5                	mov    %esp,%ebp
  101c96:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101c99:	8b 45 08             	mov    0x8(%ebp),%eax
  101c9c:	8b 40 30             	mov    0x30(%eax),%eax
  101c9f:	83 f8 2f             	cmp    $0x2f,%eax
  101ca2:	77 21                	ja     101cc5 <trap_dispatch+0x32>
  101ca4:	83 f8 2e             	cmp    $0x2e,%eax
  101ca7:	0f 83 04 01 00 00    	jae    101db1 <trap_dispatch+0x11e>
  101cad:	83 f8 21             	cmp    $0x21,%eax
  101cb0:	0f 84 81 00 00 00    	je     101d37 <trap_dispatch+0xa4>
  101cb6:	83 f8 24             	cmp    $0x24,%eax
  101cb9:	74 56                	je     101d11 <trap_dispatch+0x7e>
  101cbb:	83 f8 20             	cmp    $0x20,%eax
  101cbe:	74 16                	je     101cd6 <trap_dispatch+0x43>
  101cc0:	e9 b4 00 00 00       	jmp    101d79 <trap_dispatch+0xe6>
  101cc5:	83 e8 78             	sub    $0x78,%eax
  101cc8:	83 f8 01             	cmp    $0x1,%eax
  101ccb:	0f 87 a8 00 00 00    	ja     101d79 <trap_dispatch+0xe6>
  101cd1:	e9 87 00 00 00       	jmp    101d5d <trap_dispatch+0xca>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a function, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
    	ticks ++;
  101cd6:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101cdb:	83 c0 01             	add    $0x1,%eax
  101cde:	a3 08 f9 10 00       	mov    %eax,0x10f908
    	if(ticks % 100 == 0)
  101ce3:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101ce9:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101cee:	89 c8                	mov    %ecx,%eax
  101cf0:	f7 e2                	mul    %edx
  101cf2:	89 d0                	mov    %edx,%eax
  101cf4:	c1 e8 05             	shr    $0x5,%eax
  101cf7:	6b c0 64             	imul   $0x64,%eax,%eax
  101cfa:	29 c1                	sub    %eax,%ecx
  101cfc:	89 c8                	mov    %ecx,%eax
  101cfe:	85 c0                	test   %eax,%eax
  101d00:	75 0a                	jne    101d0c <trap_dispatch+0x79>
    		print_ticks();
  101d02:	e8 e3 fa ff ff       	call   1017ea <print_ticks>
        break;
  101d07:	e9 a6 00 00 00       	jmp    101db2 <trap_dispatch+0x11f>
  101d0c:	e9 a1 00 00 00       	jmp    101db2 <trap_dispatch+0x11f>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101d11:	e8 ab f8 ff ff       	call   1015c1 <cons_getc>
  101d16:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101d19:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101d1d:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101d21:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d25:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d29:	c7 04 24 f4 39 10 00 	movl   $0x1039f4,(%esp)
  101d30:	e8 dd e5 ff ff       	call   100312 <cprintf>
        break;
  101d35:	eb 7b                	jmp    101db2 <trap_dispatch+0x11f>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d37:	e8 85 f8 ff ff       	call   1015c1 <cons_getc>
  101d3c:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d3f:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101d43:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101d47:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d4b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d4f:	c7 04 24 06 3a 10 00 	movl   $0x103a06,(%esp)
  101d56:	e8 b7 e5 ff ff       	call   100312 <cprintf>
        break;
  101d5b:	eb 55                	jmp    101db2 <trap_dispatch+0x11f>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101d5d:	c7 44 24 08 15 3a 10 	movl   $0x103a15,0x8(%esp)
  101d64:	00 
  101d65:	c7 44 24 04 b6 00 00 	movl   $0xb6,0x4(%esp)
  101d6c:	00 
  101d6d:	c7 04 24 25 3a 10 00 	movl   $0x103a25,(%esp)
  101d74:	e8 2a ef ff ff       	call   100ca3 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101d79:	8b 45 08             	mov    0x8(%ebp),%eax
  101d7c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d80:	0f b7 c0             	movzwl %ax,%eax
  101d83:	83 e0 03             	and    $0x3,%eax
  101d86:	85 c0                	test   %eax,%eax
  101d88:	75 28                	jne    101db2 <trap_dispatch+0x11f>
            print_trapframe(tf);
  101d8a:	8b 45 08             	mov    0x8(%ebp),%eax
  101d8d:	89 04 24             	mov    %eax,(%esp)
  101d90:	e8 82 fc ff ff       	call   101a17 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101d95:	c7 44 24 08 36 3a 10 	movl   $0x103a36,0x8(%esp)
  101d9c:	00 
  101d9d:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
  101da4:	00 
  101da5:	c7 04 24 25 3a 10 00 	movl   $0x103a25,(%esp)
  101dac:	e8 f2 ee ff ff       	call   100ca3 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101db1:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101db2:	c9                   	leave  
  101db3:	c3                   	ret    

00101db4 <trap>:
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */

void
trap(struct trapframe *tf) {
  101db4:	55                   	push   %ebp
  101db5:	89 e5                	mov    %esp,%ebp
  101db7:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101dba:	8b 45 08             	mov    0x8(%ebp),%eax
  101dbd:	89 04 24             	mov    %eax,(%esp)
  101dc0:	e8 ce fe ff ff       	call   101c93 <trap_dispatch>
}
  101dc5:	c9                   	leave  
  101dc6:	c3                   	ret    

00101dc7 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101dc7:	1e                   	push   %ds
    pushl %es
  101dc8:	06                   	push   %es
    pushl %fs
  101dc9:	0f a0                	push   %fs
    pushl %gs
  101dcb:	0f a8                	push   %gs
    pushal
  101dcd:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101dce:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101dd3:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101dd5:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101dd7:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101dd8:	e8 d7 ff ff ff       	call   101db4 <trap>

    # pop the pushed stack pointer
    popl %esp
  101ddd:	5c                   	pop    %esp

00101dde <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101dde:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101ddf:	0f a9                	pop    %gs
    popl %fs
  101de1:	0f a1                	pop    %fs
    popl %es
  101de3:	07                   	pop    %es
    popl %ds
  101de4:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101de5:	83 c4 08             	add    $0x8,%esp
    iret
  101de8:	cf                   	iret   

00101de9 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101de9:	6a 00                	push   $0x0
  pushl $0
  101deb:	6a 00                	push   $0x0
  jmp __alltraps
  101ded:	e9 d5 ff ff ff       	jmp    101dc7 <__alltraps>

00101df2 <vector1>:
.globl vector1
vector1:
  pushl $0
  101df2:	6a 00                	push   $0x0
  pushl $1
  101df4:	6a 01                	push   $0x1
  jmp __alltraps
  101df6:	e9 cc ff ff ff       	jmp    101dc7 <__alltraps>

00101dfb <vector2>:
.globl vector2
vector2:
  pushl $0
  101dfb:	6a 00                	push   $0x0
  pushl $2
  101dfd:	6a 02                	push   $0x2
  jmp __alltraps
  101dff:	e9 c3 ff ff ff       	jmp    101dc7 <__alltraps>

00101e04 <vector3>:
.globl vector3
vector3:
  pushl $0
  101e04:	6a 00                	push   $0x0
  pushl $3
  101e06:	6a 03                	push   $0x3
  jmp __alltraps
  101e08:	e9 ba ff ff ff       	jmp    101dc7 <__alltraps>

00101e0d <vector4>:
.globl vector4
vector4:
  pushl $0
  101e0d:	6a 00                	push   $0x0
  pushl $4
  101e0f:	6a 04                	push   $0x4
  jmp __alltraps
  101e11:	e9 b1 ff ff ff       	jmp    101dc7 <__alltraps>

00101e16 <vector5>:
.globl vector5
vector5:
  pushl $0
  101e16:	6a 00                	push   $0x0
  pushl $5
  101e18:	6a 05                	push   $0x5
  jmp __alltraps
  101e1a:	e9 a8 ff ff ff       	jmp    101dc7 <__alltraps>

00101e1f <vector6>:
.globl vector6
vector6:
  pushl $0
  101e1f:	6a 00                	push   $0x0
  pushl $6
  101e21:	6a 06                	push   $0x6
  jmp __alltraps
  101e23:	e9 9f ff ff ff       	jmp    101dc7 <__alltraps>

00101e28 <vector7>:
.globl vector7
vector7:
  pushl $0
  101e28:	6a 00                	push   $0x0
  pushl $7
  101e2a:	6a 07                	push   $0x7
  jmp __alltraps
  101e2c:	e9 96 ff ff ff       	jmp    101dc7 <__alltraps>

00101e31 <vector8>:
.globl vector8
vector8:
  pushl $8
  101e31:	6a 08                	push   $0x8
  jmp __alltraps
  101e33:	e9 8f ff ff ff       	jmp    101dc7 <__alltraps>

00101e38 <vector9>:
.globl vector9
vector9:
  pushl $9
  101e38:	6a 09                	push   $0x9
  jmp __alltraps
  101e3a:	e9 88 ff ff ff       	jmp    101dc7 <__alltraps>

00101e3f <vector10>:
.globl vector10
vector10:
  pushl $10
  101e3f:	6a 0a                	push   $0xa
  jmp __alltraps
  101e41:	e9 81 ff ff ff       	jmp    101dc7 <__alltraps>

00101e46 <vector11>:
.globl vector11
vector11:
  pushl $11
  101e46:	6a 0b                	push   $0xb
  jmp __alltraps
  101e48:	e9 7a ff ff ff       	jmp    101dc7 <__alltraps>

00101e4d <vector12>:
.globl vector12
vector12:
  pushl $12
  101e4d:	6a 0c                	push   $0xc
  jmp __alltraps
  101e4f:	e9 73 ff ff ff       	jmp    101dc7 <__alltraps>

00101e54 <vector13>:
.globl vector13
vector13:
  pushl $13
  101e54:	6a 0d                	push   $0xd
  jmp __alltraps
  101e56:	e9 6c ff ff ff       	jmp    101dc7 <__alltraps>

00101e5b <vector14>:
.globl vector14
vector14:
  pushl $14
  101e5b:	6a 0e                	push   $0xe
  jmp __alltraps
  101e5d:	e9 65 ff ff ff       	jmp    101dc7 <__alltraps>

00101e62 <vector15>:
.globl vector15
vector15:
  pushl $0
  101e62:	6a 00                	push   $0x0
  pushl $15
  101e64:	6a 0f                	push   $0xf
  jmp __alltraps
  101e66:	e9 5c ff ff ff       	jmp    101dc7 <__alltraps>

00101e6b <vector16>:
.globl vector16
vector16:
  pushl $0
  101e6b:	6a 00                	push   $0x0
  pushl $16
  101e6d:	6a 10                	push   $0x10
  jmp __alltraps
  101e6f:	e9 53 ff ff ff       	jmp    101dc7 <__alltraps>

00101e74 <vector17>:
.globl vector17
vector17:
  pushl $17
  101e74:	6a 11                	push   $0x11
  jmp __alltraps
  101e76:	e9 4c ff ff ff       	jmp    101dc7 <__alltraps>

00101e7b <vector18>:
.globl vector18
vector18:
  pushl $0
  101e7b:	6a 00                	push   $0x0
  pushl $18
  101e7d:	6a 12                	push   $0x12
  jmp __alltraps
  101e7f:	e9 43 ff ff ff       	jmp    101dc7 <__alltraps>

00101e84 <vector19>:
.globl vector19
vector19:
  pushl $0
  101e84:	6a 00                	push   $0x0
  pushl $19
  101e86:	6a 13                	push   $0x13
  jmp __alltraps
  101e88:	e9 3a ff ff ff       	jmp    101dc7 <__alltraps>

00101e8d <vector20>:
.globl vector20
vector20:
  pushl $0
  101e8d:	6a 00                	push   $0x0
  pushl $20
  101e8f:	6a 14                	push   $0x14
  jmp __alltraps
  101e91:	e9 31 ff ff ff       	jmp    101dc7 <__alltraps>

00101e96 <vector21>:
.globl vector21
vector21:
  pushl $0
  101e96:	6a 00                	push   $0x0
  pushl $21
  101e98:	6a 15                	push   $0x15
  jmp __alltraps
  101e9a:	e9 28 ff ff ff       	jmp    101dc7 <__alltraps>

00101e9f <vector22>:
.globl vector22
vector22:
  pushl $0
  101e9f:	6a 00                	push   $0x0
  pushl $22
  101ea1:	6a 16                	push   $0x16
  jmp __alltraps
  101ea3:	e9 1f ff ff ff       	jmp    101dc7 <__alltraps>

00101ea8 <vector23>:
.globl vector23
vector23:
  pushl $0
  101ea8:	6a 00                	push   $0x0
  pushl $23
  101eaa:	6a 17                	push   $0x17
  jmp __alltraps
  101eac:	e9 16 ff ff ff       	jmp    101dc7 <__alltraps>

00101eb1 <vector24>:
.globl vector24
vector24:
  pushl $0
  101eb1:	6a 00                	push   $0x0
  pushl $24
  101eb3:	6a 18                	push   $0x18
  jmp __alltraps
  101eb5:	e9 0d ff ff ff       	jmp    101dc7 <__alltraps>

00101eba <vector25>:
.globl vector25
vector25:
  pushl $0
  101eba:	6a 00                	push   $0x0
  pushl $25
  101ebc:	6a 19                	push   $0x19
  jmp __alltraps
  101ebe:	e9 04 ff ff ff       	jmp    101dc7 <__alltraps>

00101ec3 <vector26>:
.globl vector26
vector26:
  pushl $0
  101ec3:	6a 00                	push   $0x0
  pushl $26
  101ec5:	6a 1a                	push   $0x1a
  jmp __alltraps
  101ec7:	e9 fb fe ff ff       	jmp    101dc7 <__alltraps>

00101ecc <vector27>:
.globl vector27
vector27:
  pushl $0
  101ecc:	6a 00                	push   $0x0
  pushl $27
  101ece:	6a 1b                	push   $0x1b
  jmp __alltraps
  101ed0:	e9 f2 fe ff ff       	jmp    101dc7 <__alltraps>

00101ed5 <vector28>:
.globl vector28
vector28:
  pushl $0
  101ed5:	6a 00                	push   $0x0
  pushl $28
  101ed7:	6a 1c                	push   $0x1c
  jmp __alltraps
  101ed9:	e9 e9 fe ff ff       	jmp    101dc7 <__alltraps>

00101ede <vector29>:
.globl vector29
vector29:
  pushl $0
  101ede:	6a 00                	push   $0x0
  pushl $29
  101ee0:	6a 1d                	push   $0x1d
  jmp __alltraps
  101ee2:	e9 e0 fe ff ff       	jmp    101dc7 <__alltraps>

00101ee7 <vector30>:
.globl vector30
vector30:
  pushl $0
  101ee7:	6a 00                	push   $0x0
  pushl $30
  101ee9:	6a 1e                	push   $0x1e
  jmp __alltraps
  101eeb:	e9 d7 fe ff ff       	jmp    101dc7 <__alltraps>

00101ef0 <vector31>:
.globl vector31
vector31:
  pushl $0
  101ef0:	6a 00                	push   $0x0
  pushl $31
  101ef2:	6a 1f                	push   $0x1f
  jmp __alltraps
  101ef4:	e9 ce fe ff ff       	jmp    101dc7 <__alltraps>

00101ef9 <vector32>:
.globl vector32
vector32:
  pushl $0
  101ef9:	6a 00                	push   $0x0
  pushl $32
  101efb:	6a 20                	push   $0x20
  jmp __alltraps
  101efd:	e9 c5 fe ff ff       	jmp    101dc7 <__alltraps>

00101f02 <vector33>:
.globl vector33
vector33:
  pushl $0
  101f02:	6a 00                	push   $0x0
  pushl $33
  101f04:	6a 21                	push   $0x21
  jmp __alltraps
  101f06:	e9 bc fe ff ff       	jmp    101dc7 <__alltraps>

00101f0b <vector34>:
.globl vector34
vector34:
  pushl $0
  101f0b:	6a 00                	push   $0x0
  pushl $34
  101f0d:	6a 22                	push   $0x22
  jmp __alltraps
  101f0f:	e9 b3 fe ff ff       	jmp    101dc7 <__alltraps>

00101f14 <vector35>:
.globl vector35
vector35:
  pushl $0
  101f14:	6a 00                	push   $0x0
  pushl $35
  101f16:	6a 23                	push   $0x23
  jmp __alltraps
  101f18:	e9 aa fe ff ff       	jmp    101dc7 <__alltraps>

00101f1d <vector36>:
.globl vector36
vector36:
  pushl $0
  101f1d:	6a 00                	push   $0x0
  pushl $36
  101f1f:	6a 24                	push   $0x24
  jmp __alltraps
  101f21:	e9 a1 fe ff ff       	jmp    101dc7 <__alltraps>

00101f26 <vector37>:
.globl vector37
vector37:
  pushl $0
  101f26:	6a 00                	push   $0x0
  pushl $37
  101f28:	6a 25                	push   $0x25
  jmp __alltraps
  101f2a:	e9 98 fe ff ff       	jmp    101dc7 <__alltraps>

00101f2f <vector38>:
.globl vector38
vector38:
  pushl $0
  101f2f:	6a 00                	push   $0x0
  pushl $38
  101f31:	6a 26                	push   $0x26
  jmp __alltraps
  101f33:	e9 8f fe ff ff       	jmp    101dc7 <__alltraps>

00101f38 <vector39>:
.globl vector39
vector39:
  pushl $0
  101f38:	6a 00                	push   $0x0
  pushl $39
  101f3a:	6a 27                	push   $0x27
  jmp __alltraps
  101f3c:	e9 86 fe ff ff       	jmp    101dc7 <__alltraps>

00101f41 <vector40>:
.globl vector40
vector40:
  pushl $0
  101f41:	6a 00                	push   $0x0
  pushl $40
  101f43:	6a 28                	push   $0x28
  jmp __alltraps
  101f45:	e9 7d fe ff ff       	jmp    101dc7 <__alltraps>

00101f4a <vector41>:
.globl vector41
vector41:
  pushl $0
  101f4a:	6a 00                	push   $0x0
  pushl $41
  101f4c:	6a 29                	push   $0x29
  jmp __alltraps
  101f4e:	e9 74 fe ff ff       	jmp    101dc7 <__alltraps>

00101f53 <vector42>:
.globl vector42
vector42:
  pushl $0
  101f53:	6a 00                	push   $0x0
  pushl $42
  101f55:	6a 2a                	push   $0x2a
  jmp __alltraps
  101f57:	e9 6b fe ff ff       	jmp    101dc7 <__alltraps>

00101f5c <vector43>:
.globl vector43
vector43:
  pushl $0
  101f5c:	6a 00                	push   $0x0
  pushl $43
  101f5e:	6a 2b                	push   $0x2b
  jmp __alltraps
  101f60:	e9 62 fe ff ff       	jmp    101dc7 <__alltraps>

00101f65 <vector44>:
.globl vector44
vector44:
  pushl $0
  101f65:	6a 00                	push   $0x0
  pushl $44
  101f67:	6a 2c                	push   $0x2c
  jmp __alltraps
  101f69:	e9 59 fe ff ff       	jmp    101dc7 <__alltraps>

00101f6e <vector45>:
.globl vector45
vector45:
  pushl $0
  101f6e:	6a 00                	push   $0x0
  pushl $45
  101f70:	6a 2d                	push   $0x2d
  jmp __alltraps
  101f72:	e9 50 fe ff ff       	jmp    101dc7 <__alltraps>

00101f77 <vector46>:
.globl vector46
vector46:
  pushl $0
  101f77:	6a 00                	push   $0x0
  pushl $46
  101f79:	6a 2e                	push   $0x2e
  jmp __alltraps
  101f7b:	e9 47 fe ff ff       	jmp    101dc7 <__alltraps>

00101f80 <vector47>:
.globl vector47
vector47:
  pushl $0
  101f80:	6a 00                	push   $0x0
  pushl $47
  101f82:	6a 2f                	push   $0x2f
  jmp __alltraps
  101f84:	e9 3e fe ff ff       	jmp    101dc7 <__alltraps>

00101f89 <vector48>:
.globl vector48
vector48:
  pushl $0
  101f89:	6a 00                	push   $0x0
  pushl $48
  101f8b:	6a 30                	push   $0x30
  jmp __alltraps
  101f8d:	e9 35 fe ff ff       	jmp    101dc7 <__alltraps>

00101f92 <vector49>:
.globl vector49
vector49:
  pushl $0
  101f92:	6a 00                	push   $0x0
  pushl $49
  101f94:	6a 31                	push   $0x31
  jmp __alltraps
  101f96:	e9 2c fe ff ff       	jmp    101dc7 <__alltraps>

00101f9b <vector50>:
.globl vector50
vector50:
  pushl $0
  101f9b:	6a 00                	push   $0x0
  pushl $50
  101f9d:	6a 32                	push   $0x32
  jmp __alltraps
  101f9f:	e9 23 fe ff ff       	jmp    101dc7 <__alltraps>

00101fa4 <vector51>:
.globl vector51
vector51:
  pushl $0
  101fa4:	6a 00                	push   $0x0
  pushl $51
  101fa6:	6a 33                	push   $0x33
  jmp __alltraps
  101fa8:	e9 1a fe ff ff       	jmp    101dc7 <__alltraps>

00101fad <vector52>:
.globl vector52
vector52:
  pushl $0
  101fad:	6a 00                	push   $0x0
  pushl $52
  101faf:	6a 34                	push   $0x34
  jmp __alltraps
  101fb1:	e9 11 fe ff ff       	jmp    101dc7 <__alltraps>

00101fb6 <vector53>:
.globl vector53
vector53:
  pushl $0
  101fb6:	6a 00                	push   $0x0
  pushl $53
  101fb8:	6a 35                	push   $0x35
  jmp __alltraps
  101fba:	e9 08 fe ff ff       	jmp    101dc7 <__alltraps>

00101fbf <vector54>:
.globl vector54
vector54:
  pushl $0
  101fbf:	6a 00                	push   $0x0
  pushl $54
  101fc1:	6a 36                	push   $0x36
  jmp __alltraps
  101fc3:	e9 ff fd ff ff       	jmp    101dc7 <__alltraps>

00101fc8 <vector55>:
.globl vector55
vector55:
  pushl $0
  101fc8:	6a 00                	push   $0x0
  pushl $55
  101fca:	6a 37                	push   $0x37
  jmp __alltraps
  101fcc:	e9 f6 fd ff ff       	jmp    101dc7 <__alltraps>

00101fd1 <vector56>:
.globl vector56
vector56:
  pushl $0
  101fd1:	6a 00                	push   $0x0
  pushl $56
  101fd3:	6a 38                	push   $0x38
  jmp __alltraps
  101fd5:	e9 ed fd ff ff       	jmp    101dc7 <__alltraps>

00101fda <vector57>:
.globl vector57
vector57:
  pushl $0
  101fda:	6a 00                	push   $0x0
  pushl $57
  101fdc:	6a 39                	push   $0x39
  jmp __alltraps
  101fde:	e9 e4 fd ff ff       	jmp    101dc7 <__alltraps>

00101fe3 <vector58>:
.globl vector58
vector58:
  pushl $0
  101fe3:	6a 00                	push   $0x0
  pushl $58
  101fe5:	6a 3a                	push   $0x3a
  jmp __alltraps
  101fe7:	e9 db fd ff ff       	jmp    101dc7 <__alltraps>

00101fec <vector59>:
.globl vector59
vector59:
  pushl $0
  101fec:	6a 00                	push   $0x0
  pushl $59
  101fee:	6a 3b                	push   $0x3b
  jmp __alltraps
  101ff0:	e9 d2 fd ff ff       	jmp    101dc7 <__alltraps>

00101ff5 <vector60>:
.globl vector60
vector60:
  pushl $0
  101ff5:	6a 00                	push   $0x0
  pushl $60
  101ff7:	6a 3c                	push   $0x3c
  jmp __alltraps
  101ff9:	e9 c9 fd ff ff       	jmp    101dc7 <__alltraps>

00101ffe <vector61>:
.globl vector61
vector61:
  pushl $0
  101ffe:	6a 00                	push   $0x0
  pushl $61
  102000:	6a 3d                	push   $0x3d
  jmp __alltraps
  102002:	e9 c0 fd ff ff       	jmp    101dc7 <__alltraps>

00102007 <vector62>:
.globl vector62
vector62:
  pushl $0
  102007:	6a 00                	push   $0x0
  pushl $62
  102009:	6a 3e                	push   $0x3e
  jmp __alltraps
  10200b:	e9 b7 fd ff ff       	jmp    101dc7 <__alltraps>

00102010 <vector63>:
.globl vector63
vector63:
  pushl $0
  102010:	6a 00                	push   $0x0
  pushl $63
  102012:	6a 3f                	push   $0x3f
  jmp __alltraps
  102014:	e9 ae fd ff ff       	jmp    101dc7 <__alltraps>

00102019 <vector64>:
.globl vector64
vector64:
  pushl $0
  102019:	6a 00                	push   $0x0
  pushl $64
  10201b:	6a 40                	push   $0x40
  jmp __alltraps
  10201d:	e9 a5 fd ff ff       	jmp    101dc7 <__alltraps>

00102022 <vector65>:
.globl vector65
vector65:
  pushl $0
  102022:	6a 00                	push   $0x0
  pushl $65
  102024:	6a 41                	push   $0x41
  jmp __alltraps
  102026:	e9 9c fd ff ff       	jmp    101dc7 <__alltraps>

0010202b <vector66>:
.globl vector66
vector66:
  pushl $0
  10202b:	6a 00                	push   $0x0
  pushl $66
  10202d:	6a 42                	push   $0x42
  jmp __alltraps
  10202f:	e9 93 fd ff ff       	jmp    101dc7 <__alltraps>

00102034 <vector67>:
.globl vector67
vector67:
  pushl $0
  102034:	6a 00                	push   $0x0
  pushl $67
  102036:	6a 43                	push   $0x43
  jmp __alltraps
  102038:	e9 8a fd ff ff       	jmp    101dc7 <__alltraps>

0010203d <vector68>:
.globl vector68
vector68:
  pushl $0
  10203d:	6a 00                	push   $0x0
  pushl $68
  10203f:	6a 44                	push   $0x44
  jmp __alltraps
  102041:	e9 81 fd ff ff       	jmp    101dc7 <__alltraps>

00102046 <vector69>:
.globl vector69
vector69:
  pushl $0
  102046:	6a 00                	push   $0x0
  pushl $69
  102048:	6a 45                	push   $0x45
  jmp __alltraps
  10204a:	e9 78 fd ff ff       	jmp    101dc7 <__alltraps>

0010204f <vector70>:
.globl vector70
vector70:
  pushl $0
  10204f:	6a 00                	push   $0x0
  pushl $70
  102051:	6a 46                	push   $0x46
  jmp __alltraps
  102053:	e9 6f fd ff ff       	jmp    101dc7 <__alltraps>

00102058 <vector71>:
.globl vector71
vector71:
  pushl $0
  102058:	6a 00                	push   $0x0
  pushl $71
  10205a:	6a 47                	push   $0x47
  jmp __alltraps
  10205c:	e9 66 fd ff ff       	jmp    101dc7 <__alltraps>

00102061 <vector72>:
.globl vector72
vector72:
  pushl $0
  102061:	6a 00                	push   $0x0
  pushl $72
  102063:	6a 48                	push   $0x48
  jmp __alltraps
  102065:	e9 5d fd ff ff       	jmp    101dc7 <__alltraps>

0010206a <vector73>:
.globl vector73
vector73:
  pushl $0
  10206a:	6a 00                	push   $0x0
  pushl $73
  10206c:	6a 49                	push   $0x49
  jmp __alltraps
  10206e:	e9 54 fd ff ff       	jmp    101dc7 <__alltraps>

00102073 <vector74>:
.globl vector74
vector74:
  pushl $0
  102073:	6a 00                	push   $0x0
  pushl $74
  102075:	6a 4a                	push   $0x4a
  jmp __alltraps
  102077:	e9 4b fd ff ff       	jmp    101dc7 <__alltraps>

0010207c <vector75>:
.globl vector75
vector75:
  pushl $0
  10207c:	6a 00                	push   $0x0
  pushl $75
  10207e:	6a 4b                	push   $0x4b
  jmp __alltraps
  102080:	e9 42 fd ff ff       	jmp    101dc7 <__alltraps>

00102085 <vector76>:
.globl vector76
vector76:
  pushl $0
  102085:	6a 00                	push   $0x0
  pushl $76
  102087:	6a 4c                	push   $0x4c
  jmp __alltraps
  102089:	e9 39 fd ff ff       	jmp    101dc7 <__alltraps>

0010208e <vector77>:
.globl vector77
vector77:
  pushl $0
  10208e:	6a 00                	push   $0x0
  pushl $77
  102090:	6a 4d                	push   $0x4d
  jmp __alltraps
  102092:	e9 30 fd ff ff       	jmp    101dc7 <__alltraps>

00102097 <vector78>:
.globl vector78
vector78:
  pushl $0
  102097:	6a 00                	push   $0x0
  pushl $78
  102099:	6a 4e                	push   $0x4e
  jmp __alltraps
  10209b:	e9 27 fd ff ff       	jmp    101dc7 <__alltraps>

001020a0 <vector79>:
.globl vector79
vector79:
  pushl $0
  1020a0:	6a 00                	push   $0x0
  pushl $79
  1020a2:	6a 4f                	push   $0x4f
  jmp __alltraps
  1020a4:	e9 1e fd ff ff       	jmp    101dc7 <__alltraps>

001020a9 <vector80>:
.globl vector80
vector80:
  pushl $0
  1020a9:	6a 00                	push   $0x0
  pushl $80
  1020ab:	6a 50                	push   $0x50
  jmp __alltraps
  1020ad:	e9 15 fd ff ff       	jmp    101dc7 <__alltraps>

001020b2 <vector81>:
.globl vector81
vector81:
  pushl $0
  1020b2:	6a 00                	push   $0x0
  pushl $81
  1020b4:	6a 51                	push   $0x51
  jmp __alltraps
  1020b6:	e9 0c fd ff ff       	jmp    101dc7 <__alltraps>

001020bb <vector82>:
.globl vector82
vector82:
  pushl $0
  1020bb:	6a 00                	push   $0x0
  pushl $82
  1020bd:	6a 52                	push   $0x52
  jmp __alltraps
  1020bf:	e9 03 fd ff ff       	jmp    101dc7 <__alltraps>

001020c4 <vector83>:
.globl vector83
vector83:
  pushl $0
  1020c4:	6a 00                	push   $0x0
  pushl $83
  1020c6:	6a 53                	push   $0x53
  jmp __alltraps
  1020c8:	e9 fa fc ff ff       	jmp    101dc7 <__alltraps>

001020cd <vector84>:
.globl vector84
vector84:
  pushl $0
  1020cd:	6a 00                	push   $0x0
  pushl $84
  1020cf:	6a 54                	push   $0x54
  jmp __alltraps
  1020d1:	e9 f1 fc ff ff       	jmp    101dc7 <__alltraps>

001020d6 <vector85>:
.globl vector85
vector85:
  pushl $0
  1020d6:	6a 00                	push   $0x0
  pushl $85
  1020d8:	6a 55                	push   $0x55
  jmp __alltraps
  1020da:	e9 e8 fc ff ff       	jmp    101dc7 <__alltraps>

001020df <vector86>:
.globl vector86
vector86:
  pushl $0
  1020df:	6a 00                	push   $0x0
  pushl $86
  1020e1:	6a 56                	push   $0x56
  jmp __alltraps
  1020e3:	e9 df fc ff ff       	jmp    101dc7 <__alltraps>

001020e8 <vector87>:
.globl vector87
vector87:
  pushl $0
  1020e8:	6a 00                	push   $0x0
  pushl $87
  1020ea:	6a 57                	push   $0x57
  jmp __alltraps
  1020ec:	e9 d6 fc ff ff       	jmp    101dc7 <__alltraps>

001020f1 <vector88>:
.globl vector88
vector88:
  pushl $0
  1020f1:	6a 00                	push   $0x0
  pushl $88
  1020f3:	6a 58                	push   $0x58
  jmp __alltraps
  1020f5:	e9 cd fc ff ff       	jmp    101dc7 <__alltraps>

001020fa <vector89>:
.globl vector89
vector89:
  pushl $0
  1020fa:	6a 00                	push   $0x0
  pushl $89
  1020fc:	6a 59                	push   $0x59
  jmp __alltraps
  1020fe:	e9 c4 fc ff ff       	jmp    101dc7 <__alltraps>

00102103 <vector90>:
.globl vector90
vector90:
  pushl $0
  102103:	6a 00                	push   $0x0
  pushl $90
  102105:	6a 5a                	push   $0x5a
  jmp __alltraps
  102107:	e9 bb fc ff ff       	jmp    101dc7 <__alltraps>

0010210c <vector91>:
.globl vector91
vector91:
  pushl $0
  10210c:	6a 00                	push   $0x0
  pushl $91
  10210e:	6a 5b                	push   $0x5b
  jmp __alltraps
  102110:	e9 b2 fc ff ff       	jmp    101dc7 <__alltraps>

00102115 <vector92>:
.globl vector92
vector92:
  pushl $0
  102115:	6a 00                	push   $0x0
  pushl $92
  102117:	6a 5c                	push   $0x5c
  jmp __alltraps
  102119:	e9 a9 fc ff ff       	jmp    101dc7 <__alltraps>

0010211e <vector93>:
.globl vector93
vector93:
  pushl $0
  10211e:	6a 00                	push   $0x0
  pushl $93
  102120:	6a 5d                	push   $0x5d
  jmp __alltraps
  102122:	e9 a0 fc ff ff       	jmp    101dc7 <__alltraps>

00102127 <vector94>:
.globl vector94
vector94:
  pushl $0
  102127:	6a 00                	push   $0x0
  pushl $94
  102129:	6a 5e                	push   $0x5e
  jmp __alltraps
  10212b:	e9 97 fc ff ff       	jmp    101dc7 <__alltraps>

00102130 <vector95>:
.globl vector95
vector95:
  pushl $0
  102130:	6a 00                	push   $0x0
  pushl $95
  102132:	6a 5f                	push   $0x5f
  jmp __alltraps
  102134:	e9 8e fc ff ff       	jmp    101dc7 <__alltraps>

00102139 <vector96>:
.globl vector96
vector96:
  pushl $0
  102139:	6a 00                	push   $0x0
  pushl $96
  10213b:	6a 60                	push   $0x60
  jmp __alltraps
  10213d:	e9 85 fc ff ff       	jmp    101dc7 <__alltraps>

00102142 <vector97>:
.globl vector97
vector97:
  pushl $0
  102142:	6a 00                	push   $0x0
  pushl $97
  102144:	6a 61                	push   $0x61
  jmp __alltraps
  102146:	e9 7c fc ff ff       	jmp    101dc7 <__alltraps>

0010214b <vector98>:
.globl vector98
vector98:
  pushl $0
  10214b:	6a 00                	push   $0x0
  pushl $98
  10214d:	6a 62                	push   $0x62
  jmp __alltraps
  10214f:	e9 73 fc ff ff       	jmp    101dc7 <__alltraps>

00102154 <vector99>:
.globl vector99
vector99:
  pushl $0
  102154:	6a 00                	push   $0x0
  pushl $99
  102156:	6a 63                	push   $0x63
  jmp __alltraps
  102158:	e9 6a fc ff ff       	jmp    101dc7 <__alltraps>

0010215d <vector100>:
.globl vector100
vector100:
  pushl $0
  10215d:	6a 00                	push   $0x0
  pushl $100
  10215f:	6a 64                	push   $0x64
  jmp __alltraps
  102161:	e9 61 fc ff ff       	jmp    101dc7 <__alltraps>

00102166 <vector101>:
.globl vector101
vector101:
  pushl $0
  102166:	6a 00                	push   $0x0
  pushl $101
  102168:	6a 65                	push   $0x65
  jmp __alltraps
  10216a:	e9 58 fc ff ff       	jmp    101dc7 <__alltraps>

0010216f <vector102>:
.globl vector102
vector102:
  pushl $0
  10216f:	6a 00                	push   $0x0
  pushl $102
  102171:	6a 66                	push   $0x66
  jmp __alltraps
  102173:	e9 4f fc ff ff       	jmp    101dc7 <__alltraps>

00102178 <vector103>:
.globl vector103
vector103:
  pushl $0
  102178:	6a 00                	push   $0x0
  pushl $103
  10217a:	6a 67                	push   $0x67
  jmp __alltraps
  10217c:	e9 46 fc ff ff       	jmp    101dc7 <__alltraps>

00102181 <vector104>:
.globl vector104
vector104:
  pushl $0
  102181:	6a 00                	push   $0x0
  pushl $104
  102183:	6a 68                	push   $0x68
  jmp __alltraps
  102185:	e9 3d fc ff ff       	jmp    101dc7 <__alltraps>

0010218a <vector105>:
.globl vector105
vector105:
  pushl $0
  10218a:	6a 00                	push   $0x0
  pushl $105
  10218c:	6a 69                	push   $0x69
  jmp __alltraps
  10218e:	e9 34 fc ff ff       	jmp    101dc7 <__alltraps>

00102193 <vector106>:
.globl vector106
vector106:
  pushl $0
  102193:	6a 00                	push   $0x0
  pushl $106
  102195:	6a 6a                	push   $0x6a
  jmp __alltraps
  102197:	e9 2b fc ff ff       	jmp    101dc7 <__alltraps>

0010219c <vector107>:
.globl vector107
vector107:
  pushl $0
  10219c:	6a 00                	push   $0x0
  pushl $107
  10219e:	6a 6b                	push   $0x6b
  jmp __alltraps
  1021a0:	e9 22 fc ff ff       	jmp    101dc7 <__alltraps>

001021a5 <vector108>:
.globl vector108
vector108:
  pushl $0
  1021a5:	6a 00                	push   $0x0
  pushl $108
  1021a7:	6a 6c                	push   $0x6c
  jmp __alltraps
  1021a9:	e9 19 fc ff ff       	jmp    101dc7 <__alltraps>

001021ae <vector109>:
.globl vector109
vector109:
  pushl $0
  1021ae:	6a 00                	push   $0x0
  pushl $109
  1021b0:	6a 6d                	push   $0x6d
  jmp __alltraps
  1021b2:	e9 10 fc ff ff       	jmp    101dc7 <__alltraps>

001021b7 <vector110>:
.globl vector110
vector110:
  pushl $0
  1021b7:	6a 00                	push   $0x0
  pushl $110
  1021b9:	6a 6e                	push   $0x6e
  jmp __alltraps
  1021bb:	e9 07 fc ff ff       	jmp    101dc7 <__alltraps>

001021c0 <vector111>:
.globl vector111
vector111:
  pushl $0
  1021c0:	6a 00                	push   $0x0
  pushl $111
  1021c2:	6a 6f                	push   $0x6f
  jmp __alltraps
  1021c4:	e9 fe fb ff ff       	jmp    101dc7 <__alltraps>

001021c9 <vector112>:
.globl vector112
vector112:
  pushl $0
  1021c9:	6a 00                	push   $0x0
  pushl $112
  1021cb:	6a 70                	push   $0x70
  jmp __alltraps
  1021cd:	e9 f5 fb ff ff       	jmp    101dc7 <__alltraps>

001021d2 <vector113>:
.globl vector113
vector113:
  pushl $0
  1021d2:	6a 00                	push   $0x0
  pushl $113
  1021d4:	6a 71                	push   $0x71
  jmp __alltraps
  1021d6:	e9 ec fb ff ff       	jmp    101dc7 <__alltraps>

001021db <vector114>:
.globl vector114
vector114:
  pushl $0
  1021db:	6a 00                	push   $0x0
  pushl $114
  1021dd:	6a 72                	push   $0x72
  jmp __alltraps
  1021df:	e9 e3 fb ff ff       	jmp    101dc7 <__alltraps>

001021e4 <vector115>:
.globl vector115
vector115:
  pushl $0
  1021e4:	6a 00                	push   $0x0
  pushl $115
  1021e6:	6a 73                	push   $0x73
  jmp __alltraps
  1021e8:	e9 da fb ff ff       	jmp    101dc7 <__alltraps>

001021ed <vector116>:
.globl vector116
vector116:
  pushl $0
  1021ed:	6a 00                	push   $0x0
  pushl $116
  1021ef:	6a 74                	push   $0x74
  jmp __alltraps
  1021f1:	e9 d1 fb ff ff       	jmp    101dc7 <__alltraps>

001021f6 <vector117>:
.globl vector117
vector117:
  pushl $0
  1021f6:	6a 00                	push   $0x0
  pushl $117
  1021f8:	6a 75                	push   $0x75
  jmp __alltraps
  1021fa:	e9 c8 fb ff ff       	jmp    101dc7 <__alltraps>

001021ff <vector118>:
.globl vector118
vector118:
  pushl $0
  1021ff:	6a 00                	push   $0x0
  pushl $118
  102201:	6a 76                	push   $0x76
  jmp __alltraps
  102203:	e9 bf fb ff ff       	jmp    101dc7 <__alltraps>

00102208 <vector119>:
.globl vector119
vector119:
  pushl $0
  102208:	6a 00                	push   $0x0
  pushl $119
  10220a:	6a 77                	push   $0x77
  jmp __alltraps
  10220c:	e9 b6 fb ff ff       	jmp    101dc7 <__alltraps>

00102211 <vector120>:
.globl vector120
vector120:
  pushl $0
  102211:	6a 00                	push   $0x0
  pushl $120
  102213:	6a 78                	push   $0x78
  jmp __alltraps
  102215:	e9 ad fb ff ff       	jmp    101dc7 <__alltraps>

0010221a <vector121>:
.globl vector121
vector121:
  pushl $0
  10221a:	6a 00                	push   $0x0
  pushl $121
  10221c:	6a 79                	push   $0x79
  jmp __alltraps
  10221e:	e9 a4 fb ff ff       	jmp    101dc7 <__alltraps>

00102223 <vector122>:
.globl vector122
vector122:
  pushl $0
  102223:	6a 00                	push   $0x0
  pushl $122
  102225:	6a 7a                	push   $0x7a
  jmp __alltraps
  102227:	e9 9b fb ff ff       	jmp    101dc7 <__alltraps>

0010222c <vector123>:
.globl vector123
vector123:
  pushl $0
  10222c:	6a 00                	push   $0x0
  pushl $123
  10222e:	6a 7b                	push   $0x7b
  jmp __alltraps
  102230:	e9 92 fb ff ff       	jmp    101dc7 <__alltraps>

00102235 <vector124>:
.globl vector124
vector124:
  pushl $0
  102235:	6a 00                	push   $0x0
  pushl $124
  102237:	6a 7c                	push   $0x7c
  jmp __alltraps
  102239:	e9 89 fb ff ff       	jmp    101dc7 <__alltraps>

0010223e <vector125>:
.globl vector125
vector125:
  pushl $0
  10223e:	6a 00                	push   $0x0
  pushl $125
  102240:	6a 7d                	push   $0x7d
  jmp __alltraps
  102242:	e9 80 fb ff ff       	jmp    101dc7 <__alltraps>

00102247 <vector126>:
.globl vector126
vector126:
  pushl $0
  102247:	6a 00                	push   $0x0
  pushl $126
  102249:	6a 7e                	push   $0x7e
  jmp __alltraps
  10224b:	e9 77 fb ff ff       	jmp    101dc7 <__alltraps>

00102250 <vector127>:
.globl vector127
vector127:
  pushl $0
  102250:	6a 00                	push   $0x0
  pushl $127
  102252:	6a 7f                	push   $0x7f
  jmp __alltraps
  102254:	e9 6e fb ff ff       	jmp    101dc7 <__alltraps>

00102259 <vector128>:
.globl vector128
vector128:
  pushl $0
  102259:	6a 00                	push   $0x0
  pushl $128
  10225b:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102260:	e9 62 fb ff ff       	jmp    101dc7 <__alltraps>

00102265 <vector129>:
.globl vector129
vector129:
  pushl $0
  102265:	6a 00                	push   $0x0
  pushl $129
  102267:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10226c:	e9 56 fb ff ff       	jmp    101dc7 <__alltraps>

00102271 <vector130>:
.globl vector130
vector130:
  pushl $0
  102271:	6a 00                	push   $0x0
  pushl $130
  102273:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102278:	e9 4a fb ff ff       	jmp    101dc7 <__alltraps>

0010227d <vector131>:
.globl vector131
vector131:
  pushl $0
  10227d:	6a 00                	push   $0x0
  pushl $131
  10227f:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102284:	e9 3e fb ff ff       	jmp    101dc7 <__alltraps>

00102289 <vector132>:
.globl vector132
vector132:
  pushl $0
  102289:	6a 00                	push   $0x0
  pushl $132
  10228b:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102290:	e9 32 fb ff ff       	jmp    101dc7 <__alltraps>

00102295 <vector133>:
.globl vector133
vector133:
  pushl $0
  102295:	6a 00                	push   $0x0
  pushl $133
  102297:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10229c:	e9 26 fb ff ff       	jmp    101dc7 <__alltraps>

001022a1 <vector134>:
.globl vector134
vector134:
  pushl $0
  1022a1:	6a 00                	push   $0x0
  pushl $134
  1022a3:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1022a8:	e9 1a fb ff ff       	jmp    101dc7 <__alltraps>

001022ad <vector135>:
.globl vector135
vector135:
  pushl $0
  1022ad:	6a 00                	push   $0x0
  pushl $135
  1022af:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1022b4:	e9 0e fb ff ff       	jmp    101dc7 <__alltraps>

001022b9 <vector136>:
.globl vector136
vector136:
  pushl $0
  1022b9:	6a 00                	push   $0x0
  pushl $136
  1022bb:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1022c0:	e9 02 fb ff ff       	jmp    101dc7 <__alltraps>

001022c5 <vector137>:
.globl vector137
vector137:
  pushl $0
  1022c5:	6a 00                	push   $0x0
  pushl $137
  1022c7:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1022cc:	e9 f6 fa ff ff       	jmp    101dc7 <__alltraps>

001022d1 <vector138>:
.globl vector138
vector138:
  pushl $0
  1022d1:	6a 00                	push   $0x0
  pushl $138
  1022d3:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1022d8:	e9 ea fa ff ff       	jmp    101dc7 <__alltraps>

001022dd <vector139>:
.globl vector139
vector139:
  pushl $0
  1022dd:	6a 00                	push   $0x0
  pushl $139
  1022df:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1022e4:	e9 de fa ff ff       	jmp    101dc7 <__alltraps>

001022e9 <vector140>:
.globl vector140
vector140:
  pushl $0
  1022e9:	6a 00                	push   $0x0
  pushl $140
  1022eb:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1022f0:	e9 d2 fa ff ff       	jmp    101dc7 <__alltraps>

001022f5 <vector141>:
.globl vector141
vector141:
  pushl $0
  1022f5:	6a 00                	push   $0x0
  pushl $141
  1022f7:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1022fc:	e9 c6 fa ff ff       	jmp    101dc7 <__alltraps>

00102301 <vector142>:
.globl vector142
vector142:
  pushl $0
  102301:	6a 00                	push   $0x0
  pushl $142
  102303:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102308:	e9 ba fa ff ff       	jmp    101dc7 <__alltraps>

0010230d <vector143>:
.globl vector143
vector143:
  pushl $0
  10230d:	6a 00                	push   $0x0
  pushl $143
  10230f:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102314:	e9 ae fa ff ff       	jmp    101dc7 <__alltraps>

00102319 <vector144>:
.globl vector144
vector144:
  pushl $0
  102319:	6a 00                	push   $0x0
  pushl $144
  10231b:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102320:	e9 a2 fa ff ff       	jmp    101dc7 <__alltraps>

00102325 <vector145>:
.globl vector145
vector145:
  pushl $0
  102325:	6a 00                	push   $0x0
  pushl $145
  102327:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10232c:	e9 96 fa ff ff       	jmp    101dc7 <__alltraps>

00102331 <vector146>:
.globl vector146
vector146:
  pushl $0
  102331:	6a 00                	push   $0x0
  pushl $146
  102333:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102338:	e9 8a fa ff ff       	jmp    101dc7 <__alltraps>

0010233d <vector147>:
.globl vector147
vector147:
  pushl $0
  10233d:	6a 00                	push   $0x0
  pushl $147
  10233f:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102344:	e9 7e fa ff ff       	jmp    101dc7 <__alltraps>

00102349 <vector148>:
.globl vector148
vector148:
  pushl $0
  102349:	6a 00                	push   $0x0
  pushl $148
  10234b:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102350:	e9 72 fa ff ff       	jmp    101dc7 <__alltraps>

00102355 <vector149>:
.globl vector149
vector149:
  pushl $0
  102355:	6a 00                	push   $0x0
  pushl $149
  102357:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10235c:	e9 66 fa ff ff       	jmp    101dc7 <__alltraps>

00102361 <vector150>:
.globl vector150
vector150:
  pushl $0
  102361:	6a 00                	push   $0x0
  pushl $150
  102363:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102368:	e9 5a fa ff ff       	jmp    101dc7 <__alltraps>

0010236d <vector151>:
.globl vector151
vector151:
  pushl $0
  10236d:	6a 00                	push   $0x0
  pushl $151
  10236f:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102374:	e9 4e fa ff ff       	jmp    101dc7 <__alltraps>

00102379 <vector152>:
.globl vector152
vector152:
  pushl $0
  102379:	6a 00                	push   $0x0
  pushl $152
  10237b:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102380:	e9 42 fa ff ff       	jmp    101dc7 <__alltraps>

00102385 <vector153>:
.globl vector153
vector153:
  pushl $0
  102385:	6a 00                	push   $0x0
  pushl $153
  102387:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10238c:	e9 36 fa ff ff       	jmp    101dc7 <__alltraps>

00102391 <vector154>:
.globl vector154
vector154:
  pushl $0
  102391:	6a 00                	push   $0x0
  pushl $154
  102393:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102398:	e9 2a fa ff ff       	jmp    101dc7 <__alltraps>

0010239d <vector155>:
.globl vector155
vector155:
  pushl $0
  10239d:	6a 00                	push   $0x0
  pushl $155
  10239f:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1023a4:	e9 1e fa ff ff       	jmp    101dc7 <__alltraps>

001023a9 <vector156>:
.globl vector156
vector156:
  pushl $0
  1023a9:	6a 00                	push   $0x0
  pushl $156
  1023ab:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1023b0:	e9 12 fa ff ff       	jmp    101dc7 <__alltraps>

001023b5 <vector157>:
.globl vector157
vector157:
  pushl $0
  1023b5:	6a 00                	push   $0x0
  pushl $157
  1023b7:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1023bc:	e9 06 fa ff ff       	jmp    101dc7 <__alltraps>

001023c1 <vector158>:
.globl vector158
vector158:
  pushl $0
  1023c1:	6a 00                	push   $0x0
  pushl $158
  1023c3:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1023c8:	e9 fa f9 ff ff       	jmp    101dc7 <__alltraps>

001023cd <vector159>:
.globl vector159
vector159:
  pushl $0
  1023cd:	6a 00                	push   $0x0
  pushl $159
  1023cf:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1023d4:	e9 ee f9 ff ff       	jmp    101dc7 <__alltraps>

001023d9 <vector160>:
.globl vector160
vector160:
  pushl $0
  1023d9:	6a 00                	push   $0x0
  pushl $160
  1023db:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1023e0:	e9 e2 f9 ff ff       	jmp    101dc7 <__alltraps>

001023e5 <vector161>:
.globl vector161
vector161:
  pushl $0
  1023e5:	6a 00                	push   $0x0
  pushl $161
  1023e7:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1023ec:	e9 d6 f9 ff ff       	jmp    101dc7 <__alltraps>

001023f1 <vector162>:
.globl vector162
vector162:
  pushl $0
  1023f1:	6a 00                	push   $0x0
  pushl $162
  1023f3:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1023f8:	e9 ca f9 ff ff       	jmp    101dc7 <__alltraps>

001023fd <vector163>:
.globl vector163
vector163:
  pushl $0
  1023fd:	6a 00                	push   $0x0
  pushl $163
  1023ff:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102404:	e9 be f9 ff ff       	jmp    101dc7 <__alltraps>

00102409 <vector164>:
.globl vector164
vector164:
  pushl $0
  102409:	6a 00                	push   $0x0
  pushl $164
  10240b:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102410:	e9 b2 f9 ff ff       	jmp    101dc7 <__alltraps>

00102415 <vector165>:
.globl vector165
vector165:
  pushl $0
  102415:	6a 00                	push   $0x0
  pushl $165
  102417:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10241c:	e9 a6 f9 ff ff       	jmp    101dc7 <__alltraps>

00102421 <vector166>:
.globl vector166
vector166:
  pushl $0
  102421:	6a 00                	push   $0x0
  pushl $166
  102423:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102428:	e9 9a f9 ff ff       	jmp    101dc7 <__alltraps>

0010242d <vector167>:
.globl vector167
vector167:
  pushl $0
  10242d:	6a 00                	push   $0x0
  pushl $167
  10242f:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102434:	e9 8e f9 ff ff       	jmp    101dc7 <__alltraps>

00102439 <vector168>:
.globl vector168
vector168:
  pushl $0
  102439:	6a 00                	push   $0x0
  pushl $168
  10243b:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102440:	e9 82 f9 ff ff       	jmp    101dc7 <__alltraps>

00102445 <vector169>:
.globl vector169
vector169:
  pushl $0
  102445:	6a 00                	push   $0x0
  pushl $169
  102447:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10244c:	e9 76 f9 ff ff       	jmp    101dc7 <__alltraps>

00102451 <vector170>:
.globl vector170
vector170:
  pushl $0
  102451:	6a 00                	push   $0x0
  pushl $170
  102453:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102458:	e9 6a f9 ff ff       	jmp    101dc7 <__alltraps>

0010245d <vector171>:
.globl vector171
vector171:
  pushl $0
  10245d:	6a 00                	push   $0x0
  pushl $171
  10245f:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102464:	e9 5e f9 ff ff       	jmp    101dc7 <__alltraps>

00102469 <vector172>:
.globl vector172
vector172:
  pushl $0
  102469:	6a 00                	push   $0x0
  pushl $172
  10246b:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102470:	e9 52 f9 ff ff       	jmp    101dc7 <__alltraps>

00102475 <vector173>:
.globl vector173
vector173:
  pushl $0
  102475:	6a 00                	push   $0x0
  pushl $173
  102477:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10247c:	e9 46 f9 ff ff       	jmp    101dc7 <__alltraps>

00102481 <vector174>:
.globl vector174
vector174:
  pushl $0
  102481:	6a 00                	push   $0x0
  pushl $174
  102483:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102488:	e9 3a f9 ff ff       	jmp    101dc7 <__alltraps>

0010248d <vector175>:
.globl vector175
vector175:
  pushl $0
  10248d:	6a 00                	push   $0x0
  pushl $175
  10248f:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102494:	e9 2e f9 ff ff       	jmp    101dc7 <__alltraps>

00102499 <vector176>:
.globl vector176
vector176:
  pushl $0
  102499:	6a 00                	push   $0x0
  pushl $176
  10249b:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1024a0:	e9 22 f9 ff ff       	jmp    101dc7 <__alltraps>

001024a5 <vector177>:
.globl vector177
vector177:
  pushl $0
  1024a5:	6a 00                	push   $0x0
  pushl $177
  1024a7:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1024ac:	e9 16 f9 ff ff       	jmp    101dc7 <__alltraps>

001024b1 <vector178>:
.globl vector178
vector178:
  pushl $0
  1024b1:	6a 00                	push   $0x0
  pushl $178
  1024b3:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1024b8:	e9 0a f9 ff ff       	jmp    101dc7 <__alltraps>

001024bd <vector179>:
.globl vector179
vector179:
  pushl $0
  1024bd:	6a 00                	push   $0x0
  pushl $179
  1024bf:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1024c4:	e9 fe f8 ff ff       	jmp    101dc7 <__alltraps>

001024c9 <vector180>:
.globl vector180
vector180:
  pushl $0
  1024c9:	6a 00                	push   $0x0
  pushl $180
  1024cb:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1024d0:	e9 f2 f8 ff ff       	jmp    101dc7 <__alltraps>

001024d5 <vector181>:
.globl vector181
vector181:
  pushl $0
  1024d5:	6a 00                	push   $0x0
  pushl $181
  1024d7:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1024dc:	e9 e6 f8 ff ff       	jmp    101dc7 <__alltraps>

001024e1 <vector182>:
.globl vector182
vector182:
  pushl $0
  1024e1:	6a 00                	push   $0x0
  pushl $182
  1024e3:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1024e8:	e9 da f8 ff ff       	jmp    101dc7 <__alltraps>

001024ed <vector183>:
.globl vector183
vector183:
  pushl $0
  1024ed:	6a 00                	push   $0x0
  pushl $183
  1024ef:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1024f4:	e9 ce f8 ff ff       	jmp    101dc7 <__alltraps>

001024f9 <vector184>:
.globl vector184
vector184:
  pushl $0
  1024f9:	6a 00                	push   $0x0
  pushl $184
  1024fb:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102500:	e9 c2 f8 ff ff       	jmp    101dc7 <__alltraps>

00102505 <vector185>:
.globl vector185
vector185:
  pushl $0
  102505:	6a 00                	push   $0x0
  pushl $185
  102507:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10250c:	e9 b6 f8 ff ff       	jmp    101dc7 <__alltraps>

00102511 <vector186>:
.globl vector186
vector186:
  pushl $0
  102511:	6a 00                	push   $0x0
  pushl $186
  102513:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102518:	e9 aa f8 ff ff       	jmp    101dc7 <__alltraps>

0010251d <vector187>:
.globl vector187
vector187:
  pushl $0
  10251d:	6a 00                	push   $0x0
  pushl $187
  10251f:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102524:	e9 9e f8 ff ff       	jmp    101dc7 <__alltraps>

00102529 <vector188>:
.globl vector188
vector188:
  pushl $0
  102529:	6a 00                	push   $0x0
  pushl $188
  10252b:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102530:	e9 92 f8 ff ff       	jmp    101dc7 <__alltraps>

00102535 <vector189>:
.globl vector189
vector189:
  pushl $0
  102535:	6a 00                	push   $0x0
  pushl $189
  102537:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10253c:	e9 86 f8 ff ff       	jmp    101dc7 <__alltraps>

00102541 <vector190>:
.globl vector190
vector190:
  pushl $0
  102541:	6a 00                	push   $0x0
  pushl $190
  102543:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102548:	e9 7a f8 ff ff       	jmp    101dc7 <__alltraps>

0010254d <vector191>:
.globl vector191
vector191:
  pushl $0
  10254d:	6a 00                	push   $0x0
  pushl $191
  10254f:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102554:	e9 6e f8 ff ff       	jmp    101dc7 <__alltraps>

00102559 <vector192>:
.globl vector192
vector192:
  pushl $0
  102559:	6a 00                	push   $0x0
  pushl $192
  10255b:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102560:	e9 62 f8 ff ff       	jmp    101dc7 <__alltraps>

00102565 <vector193>:
.globl vector193
vector193:
  pushl $0
  102565:	6a 00                	push   $0x0
  pushl $193
  102567:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10256c:	e9 56 f8 ff ff       	jmp    101dc7 <__alltraps>

00102571 <vector194>:
.globl vector194
vector194:
  pushl $0
  102571:	6a 00                	push   $0x0
  pushl $194
  102573:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102578:	e9 4a f8 ff ff       	jmp    101dc7 <__alltraps>

0010257d <vector195>:
.globl vector195
vector195:
  pushl $0
  10257d:	6a 00                	push   $0x0
  pushl $195
  10257f:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102584:	e9 3e f8 ff ff       	jmp    101dc7 <__alltraps>

00102589 <vector196>:
.globl vector196
vector196:
  pushl $0
  102589:	6a 00                	push   $0x0
  pushl $196
  10258b:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102590:	e9 32 f8 ff ff       	jmp    101dc7 <__alltraps>

00102595 <vector197>:
.globl vector197
vector197:
  pushl $0
  102595:	6a 00                	push   $0x0
  pushl $197
  102597:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10259c:	e9 26 f8 ff ff       	jmp    101dc7 <__alltraps>

001025a1 <vector198>:
.globl vector198
vector198:
  pushl $0
  1025a1:	6a 00                	push   $0x0
  pushl $198
  1025a3:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1025a8:	e9 1a f8 ff ff       	jmp    101dc7 <__alltraps>

001025ad <vector199>:
.globl vector199
vector199:
  pushl $0
  1025ad:	6a 00                	push   $0x0
  pushl $199
  1025af:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1025b4:	e9 0e f8 ff ff       	jmp    101dc7 <__alltraps>

001025b9 <vector200>:
.globl vector200
vector200:
  pushl $0
  1025b9:	6a 00                	push   $0x0
  pushl $200
  1025bb:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1025c0:	e9 02 f8 ff ff       	jmp    101dc7 <__alltraps>

001025c5 <vector201>:
.globl vector201
vector201:
  pushl $0
  1025c5:	6a 00                	push   $0x0
  pushl $201
  1025c7:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1025cc:	e9 f6 f7 ff ff       	jmp    101dc7 <__alltraps>

001025d1 <vector202>:
.globl vector202
vector202:
  pushl $0
  1025d1:	6a 00                	push   $0x0
  pushl $202
  1025d3:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1025d8:	e9 ea f7 ff ff       	jmp    101dc7 <__alltraps>

001025dd <vector203>:
.globl vector203
vector203:
  pushl $0
  1025dd:	6a 00                	push   $0x0
  pushl $203
  1025df:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1025e4:	e9 de f7 ff ff       	jmp    101dc7 <__alltraps>

001025e9 <vector204>:
.globl vector204
vector204:
  pushl $0
  1025e9:	6a 00                	push   $0x0
  pushl $204
  1025eb:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1025f0:	e9 d2 f7 ff ff       	jmp    101dc7 <__alltraps>

001025f5 <vector205>:
.globl vector205
vector205:
  pushl $0
  1025f5:	6a 00                	push   $0x0
  pushl $205
  1025f7:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1025fc:	e9 c6 f7 ff ff       	jmp    101dc7 <__alltraps>

00102601 <vector206>:
.globl vector206
vector206:
  pushl $0
  102601:	6a 00                	push   $0x0
  pushl $206
  102603:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102608:	e9 ba f7 ff ff       	jmp    101dc7 <__alltraps>

0010260d <vector207>:
.globl vector207
vector207:
  pushl $0
  10260d:	6a 00                	push   $0x0
  pushl $207
  10260f:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102614:	e9 ae f7 ff ff       	jmp    101dc7 <__alltraps>

00102619 <vector208>:
.globl vector208
vector208:
  pushl $0
  102619:	6a 00                	push   $0x0
  pushl $208
  10261b:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102620:	e9 a2 f7 ff ff       	jmp    101dc7 <__alltraps>

00102625 <vector209>:
.globl vector209
vector209:
  pushl $0
  102625:	6a 00                	push   $0x0
  pushl $209
  102627:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10262c:	e9 96 f7 ff ff       	jmp    101dc7 <__alltraps>

00102631 <vector210>:
.globl vector210
vector210:
  pushl $0
  102631:	6a 00                	push   $0x0
  pushl $210
  102633:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102638:	e9 8a f7 ff ff       	jmp    101dc7 <__alltraps>

0010263d <vector211>:
.globl vector211
vector211:
  pushl $0
  10263d:	6a 00                	push   $0x0
  pushl $211
  10263f:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102644:	e9 7e f7 ff ff       	jmp    101dc7 <__alltraps>

00102649 <vector212>:
.globl vector212
vector212:
  pushl $0
  102649:	6a 00                	push   $0x0
  pushl $212
  10264b:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102650:	e9 72 f7 ff ff       	jmp    101dc7 <__alltraps>

00102655 <vector213>:
.globl vector213
vector213:
  pushl $0
  102655:	6a 00                	push   $0x0
  pushl $213
  102657:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10265c:	e9 66 f7 ff ff       	jmp    101dc7 <__alltraps>

00102661 <vector214>:
.globl vector214
vector214:
  pushl $0
  102661:	6a 00                	push   $0x0
  pushl $214
  102663:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102668:	e9 5a f7 ff ff       	jmp    101dc7 <__alltraps>

0010266d <vector215>:
.globl vector215
vector215:
  pushl $0
  10266d:	6a 00                	push   $0x0
  pushl $215
  10266f:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102674:	e9 4e f7 ff ff       	jmp    101dc7 <__alltraps>

00102679 <vector216>:
.globl vector216
vector216:
  pushl $0
  102679:	6a 00                	push   $0x0
  pushl $216
  10267b:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102680:	e9 42 f7 ff ff       	jmp    101dc7 <__alltraps>

00102685 <vector217>:
.globl vector217
vector217:
  pushl $0
  102685:	6a 00                	push   $0x0
  pushl $217
  102687:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10268c:	e9 36 f7 ff ff       	jmp    101dc7 <__alltraps>

00102691 <vector218>:
.globl vector218
vector218:
  pushl $0
  102691:	6a 00                	push   $0x0
  pushl $218
  102693:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102698:	e9 2a f7 ff ff       	jmp    101dc7 <__alltraps>

0010269d <vector219>:
.globl vector219
vector219:
  pushl $0
  10269d:	6a 00                	push   $0x0
  pushl $219
  10269f:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1026a4:	e9 1e f7 ff ff       	jmp    101dc7 <__alltraps>

001026a9 <vector220>:
.globl vector220
vector220:
  pushl $0
  1026a9:	6a 00                	push   $0x0
  pushl $220
  1026ab:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1026b0:	e9 12 f7 ff ff       	jmp    101dc7 <__alltraps>

001026b5 <vector221>:
.globl vector221
vector221:
  pushl $0
  1026b5:	6a 00                	push   $0x0
  pushl $221
  1026b7:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1026bc:	e9 06 f7 ff ff       	jmp    101dc7 <__alltraps>

001026c1 <vector222>:
.globl vector222
vector222:
  pushl $0
  1026c1:	6a 00                	push   $0x0
  pushl $222
  1026c3:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1026c8:	e9 fa f6 ff ff       	jmp    101dc7 <__alltraps>

001026cd <vector223>:
.globl vector223
vector223:
  pushl $0
  1026cd:	6a 00                	push   $0x0
  pushl $223
  1026cf:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1026d4:	e9 ee f6 ff ff       	jmp    101dc7 <__alltraps>

001026d9 <vector224>:
.globl vector224
vector224:
  pushl $0
  1026d9:	6a 00                	push   $0x0
  pushl $224
  1026db:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1026e0:	e9 e2 f6 ff ff       	jmp    101dc7 <__alltraps>

001026e5 <vector225>:
.globl vector225
vector225:
  pushl $0
  1026e5:	6a 00                	push   $0x0
  pushl $225
  1026e7:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1026ec:	e9 d6 f6 ff ff       	jmp    101dc7 <__alltraps>

001026f1 <vector226>:
.globl vector226
vector226:
  pushl $0
  1026f1:	6a 00                	push   $0x0
  pushl $226
  1026f3:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1026f8:	e9 ca f6 ff ff       	jmp    101dc7 <__alltraps>

001026fd <vector227>:
.globl vector227
vector227:
  pushl $0
  1026fd:	6a 00                	push   $0x0
  pushl $227
  1026ff:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102704:	e9 be f6 ff ff       	jmp    101dc7 <__alltraps>

00102709 <vector228>:
.globl vector228
vector228:
  pushl $0
  102709:	6a 00                	push   $0x0
  pushl $228
  10270b:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102710:	e9 b2 f6 ff ff       	jmp    101dc7 <__alltraps>

00102715 <vector229>:
.globl vector229
vector229:
  pushl $0
  102715:	6a 00                	push   $0x0
  pushl $229
  102717:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10271c:	e9 a6 f6 ff ff       	jmp    101dc7 <__alltraps>

00102721 <vector230>:
.globl vector230
vector230:
  pushl $0
  102721:	6a 00                	push   $0x0
  pushl $230
  102723:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102728:	e9 9a f6 ff ff       	jmp    101dc7 <__alltraps>

0010272d <vector231>:
.globl vector231
vector231:
  pushl $0
  10272d:	6a 00                	push   $0x0
  pushl $231
  10272f:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102734:	e9 8e f6 ff ff       	jmp    101dc7 <__alltraps>

00102739 <vector232>:
.globl vector232
vector232:
  pushl $0
  102739:	6a 00                	push   $0x0
  pushl $232
  10273b:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102740:	e9 82 f6 ff ff       	jmp    101dc7 <__alltraps>

00102745 <vector233>:
.globl vector233
vector233:
  pushl $0
  102745:	6a 00                	push   $0x0
  pushl $233
  102747:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10274c:	e9 76 f6 ff ff       	jmp    101dc7 <__alltraps>

00102751 <vector234>:
.globl vector234
vector234:
  pushl $0
  102751:	6a 00                	push   $0x0
  pushl $234
  102753:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102758:	e9 6a f6 ff ff       	jmp    101dc7 <__alltraps>

0010275d <vector235>:
.globl vector235
vector235:
  pushl $0
  10275d:	6a 00                	push   $0x0
  pushl $235
  10275f:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102764:	e9 5e f6 ff ff       	jmp    101dc7 <__alltraps>

00102769 <vector236>:
.globl vector236
vector236:
  pushl $0
  102769:	6a 00                	push   $0x0
  pushl $236
  10276b:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102770:	e9 52 f6 ff ff       	jmp    101dc7 <__alltraps>

00102775 <vector237>:
.globl vector237
vector237:
  pushl $0
  102775:	6a 00                	push   $0x0
  pushl $237
  102777:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10277c:	e9 46 f6 ff ff       	jmp    101dc7 <__alltraps>

00102781 <vector238>:
.globl vector238
vector238:
  pushl $0
  102781:	6a 00                	push   $0x0
  pushl $238
  102783:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102788:	e9 3a f6 ff ff       	jmp    101dc7 <__alltraps>

0010278d <vector239>:
.globl vector239
vector239:
  pushl $0
  10278d:	6a 00                	push   $0x0
  pushl $239
  10278f:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102794:	e9 2e f6 ff ff       	jmp    101dc7 <__alltraps>

00102799 <vector240>:
.globl vector240
vector240:
  pushl $0
  102799:	6a 00                	push   $0x0
  pushl $240
  10279b:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1027a0:	e9 22 f6 ff ff       	jmp    101dc7 <__alltraps>

001027a5 <vector241>:
.globl vector241
vector241:
  pushl $0
  1027a5:	6a 00                	push   $0x0
  pushl $241
  1027a7:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1027ac:	e9 16 f6 ff ff       	jmp    101dc7 <__alltraps>

001027b1 <vector242>:
.globl vector242
vector242:
  pushl $0
  1027b1:	6a 00                	push   $0x0
  pushl $242
  1027b3:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1027b8:	e9 0a f6 ff ff       	jmp    101dc7 <__alltraps>

001027bd <vector243>:
.globl vector243
vector243:
  pushl $0
  1027bd:	6a 00                	push   $0x0
  pushl $243
  1027bf:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1027c4:	e9 fe f5 ff ff       	jmp    101dc7 <__alltraps>

001027c9 <vector244>:
.globl vector244
vector244:
  pushl $0
  1027c9:	6a 00                	push   $0x0
  pushl $244
  1027cb:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1027d0:	e9 f2 f5 ff ff       	jmp    101dc7 <__alltraps>

001027d5 <vector245>:
.globl vector245
vector245:
  pushl $0
  1027d5:	6a 00                	push   $0x0
  pushl $245
  1027d7:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1027dc:	e9 e6 f5 ff ff       	jmp    101dc7 <__alltraps>

001027e1 <vector246>:
.globl vector246
vector246:
  pushl $0
  1027e1:	6a 00                	push   $0x0
  pushl $246
  1027e3:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1027e8:	e9 da f5 ff ff       	jmp    101dc7 <__alltraps>

001027ed <vector247>:
.globl vector247
vector247:
  pushl $0
  1027ed:	6a 00                	push   $0x0
  pushl $247
  1027ef:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1027f4:	e9 ce f5 ff ff       	jmp    101dc7 <__alltraps>

001027f9 <vector248>:
.globl vector248
vector248:
  pushl $0
  1027f9:	6a 00                	push   $0x0
  pushl $248
  1027fb:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102800:	e9 c2 f5 ff ff       	jmp    101dc7 <__alltraps>

00102805 <vector249>:
.globl vector249
vector249:
  pushl $0
  102805:	6a 00                	push   $0x0
  pushl $249
  102807:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10280c:	e9 b6 f5 ff ff       	jmp    101dc7 <__alltraps>

00102811 <vector250>:
.globl vector250
vector250:
  pushl $0
  102811:	6a 00                	push   $0x0
  pushl $250
  102813:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102818:	e9 aa f5 ff ff       	jmp    101dc7 <__alltraps>

0010281d <vector251>:
.globl vector251
vector251:
  pushl $0
  10281d:	6a 00                	push   $0x0
  pushl $251
  10281f:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102824:	e9 9e f5 ff ff       	jmp    101dc7 <__alltraps>

00102829 <vector252>:
.globl vector252
vector252:
  pushl $0
  102829:	6a 00                	push   $0x0
  pushl $252
  10282b:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102830:	e9 92 f5 ff ff       	jmp    101dc7 <__alltraps>

00102835 <vector253>:
.globl vector253
vector253:
  pushl $0
  102835:	6a 00                	push   $0x0
  pushl $253
  102837:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10283c:	e9 86 f5 ff ff       	jmp    101dc7 <__alltraps>

00102841 <vector254>:
.globl vector254
vector254:
  pushl $0
  102841:	6a 00                	push   $0x0
  pushl $254
  102843:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102848:	e9 7a f5 ff ff       	jmp    101dc7 <__alltraps>

0010284d <vector255>:
.globl vector255
vector255:
  pushl $0
  10284d:	6a 00                	push   $0x0
  pushl $255
  10284f:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102854:	e9 6e f5 ff ff       	jmp    101dc7 <__alltraps>

00102859 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102859:	55                   	push   %ebp
  10285a:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10285c:	8b 45 08             	mov    0x8(%ebp),%eax
  10285f:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102862:	b8 23 00 00 00       	mov    $0x23,%eax
  102867:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102869:	b8 23 00 00 00       	mov    $0x23,%eax
  10286e:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102870:	b8 10 00 00 00       	mov    $0x10,%eax
  102875:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102877:	b8 10 00 00 00       	mov    $0x10,%eax
  10287c:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10287e:	b8 10 00 00 00       	mov    $0x10,%eax
  102883:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102885:	ea 8c 28 10 00 08 00 	ljmp   $0x8,$0x10288c
}
  10288c:	5d                   	pop    %ebp
  10288d:	c3                   	ret    

0010288e <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  10288e:	55                   	push   %ebp
  10288f:	89 e5                	mov    %esp,%ebp
  102891:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102894:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  102899:	05 00 04 00 00       	add    $0x400,%eax
  10289e:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  1028a3:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1028aa:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1028ac:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1028b3:	68 00 
  1028b5:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1028ba:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1028c0:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1028c5:	c1 e8 10             	shr    $0x10,%eax
  1028c8:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1028cd:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028d4:	83 e0 f0             	and    $0xfffffff0,%eax
  1028d7:	83 c8 09             	or     $0x9,%eax
  1028da:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028df:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028e6:	83 c8 10             	or     $0x10,%eax
  1028e9:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028ee:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028f5:	83 e0 9f             	and    $0xffffff9f,%eax
  1028f8:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028fd:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102904:	83 c8 80             	or     $0xffffff80,%eax
  102907:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10290c:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102913:	83 e0 f0             	and    $0xfffffff0,%eax
  102916:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10291b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102922:	83 e0 ef             	and    $0xffffffef,%eax
  102925:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10292a:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102931:	83 e0 df             	and    $0xffffffdf,%eax
  102934:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102939:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102940:	83 c8 40             	or     $0x40,%eax
  102943:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102948:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10294f:	83 e0 7f             	and    $0x7f,%eax
  102952:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102957:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10295c:	c1 e8 18             	shr    $0x18,%eax
  10295f:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102964:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10296b:	83 e0 ef             	and    $0xffffffef,%eax
  10296e:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102973:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  10297a:	e8 da fe ff ff       	call   102859 <lgdt>
  10297f:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102985:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102989:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  10298c:	c9                   	leave  
  10298d:	c3                   	ret    

0010298e <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  10298e:	55                   	push   %ebp
  10298f:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102991:	e8 f8 fe ff ff       	call   10288e <gdt_init>
}
  102996:	5d                   	pop    %ebp
  102997:	c3                   	ret    

00102998 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102998:	55                   	push   %ebp
  102999:	89 e5                	mov    %esp,%ebp
  10299b:	83 ec 58             	sub    $0x58,%esp
  10299e:	8b 45 10             	mov    0x10(%ebp),%eax
  1029a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1029a4:	8b 45 14             	mov    0x14(%ebp),%eax
  1029a7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  1029aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1029ad:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1029b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1029b3:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  1029b6:	8b 45 18             	mov    0x18(%ebp),%eax
  1029b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1029bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1029bf:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1029c2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1029c5:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1029c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1029ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1029d2:	74 1c                	je     1029f0 <printnum+0x58>
  1029d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029d7:	ba 00 00 00 00       	mov    $0x0,%edx
  1029dc:	f7 75 e4             	divl   -0x1c(%ebp)
  1029df:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1029e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029e5:	ba 00 00 00 00       	mov    $0x0,%edx
  1029ea:	f7 75 e4             	divl   -0x1c(%ebp)
  1029ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1029f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1029f3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1029f6:	f7 75 e4             	divl   -0x1c(%ebp)
  1029f9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1029fc:	89 55 dc             	mov    %edx,-0x24(%ebp)
  1029ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102a02:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102a05:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a08:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102a0b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102a0e:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102a11:	8b 45 18             	mov    0x18(%ebp),%eax
  102a14:	ba 00 00 00 00       	mov    $0x0,%edx
  102a19:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102a1c:	77 56                	ja     102a74 <printnum+0xdc>
  102a1e:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102a21:	72 05                	jb     102a28 <printnum+0x90>
  102a23:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102a26:	77 4c                	ja     102a74 <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102a28:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102a2b:	8d 50 ff             	lea    -0x1(%eax),%edx
  102a2e:	8b 45 20             	mov    0x20(%ebp),%eax
  102a31:	89 44 24 18          	mov    %eax,0x18(%esp)
  102a35:	89 54 24 14          	mov    %edx,0x14(%esp)
  102a39:	8b 45 18             	mov    0x18(%ebp),%eax
  102a3c:	89 44 24 10          	mov    %eax,0x10(%esp)
  102a40:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102a43:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102a46:	89 44 24 08          	mov    %eax,0x8(%esp)
  102a4a:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102a4e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a51:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a55:	8b 45 08             	mov    0x8(%ebp),%eax
  102a58:	89 04 24             	mov    %eax,(%esp)
  102a5b:	e8 38 ff ff ff       	call   102998 <printnum>
  102a60:	eb 1c                	jmp    102a7e <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102a62:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a65:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a69:	8b 45 20             	mov    0x20(%ebp),%eax
  102a6c:	89 04 24             	mov    %eax,(%esp)
  102a6f:	8b 45 08             	mov    0x8(%ebp),%eax
  102a72:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102a74:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102a78:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102a7c:	7f e4                	jg     102a62 <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102a7e:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102a81:	05 70 3c 10 00       	add    $0x103c70,%eax
  102a86:	0f b6 00             	movzbl (%eax),%eax
  102a89:	0f be c0             	movsbl %al,%eax
  102a8c:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a8f:	89 54 24 04          	mov    %edx,0x4(%esp)
  102a93:	89 04 24             	mov    %eax,(%esp)
  102a96:	8b 45 08             	mov    0x8(%ebp),%eax
  102a99:	ff d0                	call   *%eax
}
  102a9b:	c9                   	leave  
  102a9c:	c3                   	ret    

00102a9d <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102a9d:	55                   	push   %ebp
  102a9e:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102aa0:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102aa4:	7e 14                	jle    102aba <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102aa6:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa9:	8b 00                	mov    (%eax),%eax
  102aab:	8d 48 08             	lea    0x8(%eax),%ecx
  102aae:	8b 55 08             	mov    0x8(%ebp),%edx
  102ab1:	89 0a                	mov    %ecx,(%edx)
  102ab3:	8b 50 04             	mov    0x4(%eax),%edx
  102ab6:	8b 00                	mov    (%eax),%eax
  102ab8:	eb 30                	jmp    102aea <getuint+0x4d>
    }
    else if (lflag) {
  102aba:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102abe:	74 16                	je     102ad6 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102ac0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac3:	8b 00                	mov    (%eax),%eax
  102ac5:	8d 48 04             	lea    0x4(%eax),%ecx
  102ac8:	8b 55 08             	mov    0x8(%ebp),%edx
  102acb:	89 0a                	mov    %ecx,(%edx)
  102acd:	8b 00                	mov    (%eax),%eax
  102acf:	ba 00 00 00 00       	mov    $0x0,%edx
  102ad4:	eb 14                	jmp    102aea <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102ad6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ad9:	8b 00                	mov    (%eax),%eax
  102adb:	8d 48 04             	lea    0x4(%eax),%ecx
  102ade:	8b 55 08             	mov    0x8(%ebp),%edx
  102ae1:	89 0a                	mov    %ecx,(%edx)
  102ae3:	8b 00                	mov    (%eax),%eax
  102ae5:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102aea:	5d                   	pop    %ebp
  102aeb:	c3                   	ret    

00102aec <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102aec:	55                   	push   %ebp
  102aed:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102aef:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102af3:	7e 14                	jle    102b09 <getint+0x1d>
        return va_arg(*ap, long long);
  102af5:	8b 45 08             	mov    0x8(%ebp),%eax
  102af8:	8b 00                	mov    (%eax),%eax
  102afa:	8d 48 08             	lea    0x8(%eax),%ecx
  102afd:	8b 55 08             	mov    0x8(%ebp),%edx
  102b00:	89 0a                	mov    %ecx,(%edx)
  102b02:	8b 50 04             	mov    0x4(%eax),%edx
  102b05:	8b 00                	mov    (%eax),%eax
  102b07:	eb 28                	jmp    102b31 <getint+0x45>
    }
    else if (lflag) {
  102b09:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102b0d:	74 12                	je     102b21 <getint+0x35>
        return va_arg(*ap, long);
  102b0f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b12:	8b 00                	mov    (%eax),%eax
  102b14:	8d 48 04             	lea    0x4(%eax),%ecx
  102b17:	8b 55 08             	mov    0x8(%ebp),%edx
  102b1a:	89 0a                	mov    %ecx,(%edx)
  102b1c:	8b 00                	mov    (%eax),%eax
  102b1e:	99                   	cltd   
  102b1f:	eb 10                	jmp    102b31 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102b21:	8b 45 08             	mov    0x8(%ebp),%eax
  102b24:	8b 00                	mov    (%eax),%eax
  102b26:	8d 48 04             	lea    0x4(%eax),%ecx
  102b29:	8b 55 08             	mov    0x8(%ebp),%edx
  102b2c:	89 0a                	mov    %ecx,(%edx)
  102b2e:	8b 00                	mov    (%eax),%eax
  102b30:	99                   	cltd   
    }
}
  102b31:	5d                   	pop    %ebp
  102b32:	c3                   	ret    

00102b33 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102b33:	55                   	push   %ebp
  102b34:	89 e5                	mov    %esp,%ebp
  102b36:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102b39:	8d 45 14             	lea    0x14(%ebp),%eax
  102b3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102b3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b42:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102b46:	8b 45 10             	mov    0x10(%ebp),%eax
  102b49:	89 44 24 08          	mov    %eax,0x8(%esp)
  102b4d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b50:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b54:	8b 45 08             	mov    0x8(%ebp),%eax
  102b57:	89 04 24             	mov    %eax,(%esp)
  102b5a:	e8 02 00 00 00       	call   102b61 <vprintfmt>
    va_end(ap);
}
  102b5f:	c9                   	leave  
  102b60:	c3                   	ret    

00102b61 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102b61:	55                   	push   %ebp
  102b62:	89 e5                	mov    %esp,%ebp
  102b64:	56                   	push   %esi
  102b65:	53                   	push   %ebx
  102b66:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102b69:	eb 18                	jmp    102b83 <vprintfmt+0x22>
            if (ch == '\0') {
  102b6b:	85 db                	test   %ebx,%ebx
  102b6d:	75 05                	jne    102b74 <vprintfmt+0x13>
                return;
  102b6f:	e9 d1 03 00 00       	jmp    102f45 <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  102b74:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b77:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b7b:	89 1c 24             	mov    %ebx,(%esp)
  102b7e:	8b 45 08             	mov    0x8(%ebp),%eax
  102b81:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102b83:	8b 45 10             	mov    0x10(%ebp),%eax
  102b86:	8d 50 01             	lea    0x1(%eax),%edx
  102b89:	89 55 10             	mov    %edx,0x10(%ebp)
  102b8c:	0f b6 00             	movzbl (%eax),%eax
  102b8f:	0f b6 d8             	movzbl %al,%ebx
  102b92:	83 fb 25             	cmp    $0x25,%ebx
  102b95:	75 d4                	jne    102b6b <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102b97:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102b9b:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102ba2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ba5:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102ba8:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102baf:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102bb2:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102bb5:	8b 45 10             	mov    0x10(%ebp),%eax
  102bb8:	8d 50 01             	lea    0x1(%eax),%edx
  102bbb:	89 55 10             	mov    %edx,0x10(%ebp)
  102bbe:	0f b6 00             	movzbl (%eax),%eax
  102bc1:	0f b6 d8             	movzbl %al,%ebx
  102bc4:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102bc7:	83 f8 55             	cmp    $0x55,%eax
  102bca:	0f 87 44 03 00 00    	ja     102f14 <vprintfmt+0x3b3>
  102bd0:	8b 04 85 94 3c 10 00 	mov    0x103c94(,%eax,4),%eax
  102bd7:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102bd9:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102bdd:	eb d6                	jmp    102bb5 <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102bdf:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102be3:	eb d0                	jmp    102bb5 <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102be5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102bec:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102bef:	89 d0                	mov    %edx,%eax
  102bf1:	c1 e0 02             	shl    $0x2,%eax
  102bf4:	01 d0                	add    %edx,%eax
  102bf6:	01 c0                	add    %eax,%eax
  102bf8:	01 d8                	add    %ebx,%eax
  102bfa:	83 e8 30             	sub    $0x30,%eax
  102bfd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102c00:	8b 45 10             	mov    0x10(%ebp),%eax
  102c03:	0f b6 00             	movzbl (%eax),%eax
  102c06:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102c09:	83 fb 2f             	cmp    $0x2f,%ebx
  102c0c:	7e 0b                	jle    102c19 <vprintfmt+0xb8>
  102c0e:	83 fb 39             	cmp    $0x39,%ebx
  102c11:	7f 06                	jg     102c19 <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102c13:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102c17:	eb d3                	jmp    102bec <vprintfmt+0x8b>
            goto process_precision;
  102c19:	eb 33                	jmp    102c4e <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  102c1b:	8b 45 14             	mov    0x14(%ebp),%eax
  102c1e:	8d 50 04             	lea    0x4(%eax),%edx
  102c21:	89 55 14             	mov    %edx,0x14(%ebp)
  102c24:	8b 00                	mov    (%eax),%eax
  102c26:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102c29:	eb 23                	jmp    102c4e <vprintfmt+0xed>

        case '.':
            if (width < 0)
  102c2b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c2f:	79 0c                	jns    102c3d <vprintfmt+0xdc>
                width = 0;
  102c31:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102c38:	e9 78 ff ff ff       	jmp    102bb5 <vprintfmt+0x54>
  102c3d:	e9 73 ff ff ff       	jmp    102bb5 <vprintfmt+0x54>

        case '#':
            altflag = 1;
  102c42:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102c49:	e9 67 ff ff ff       	jmp    102bb5 <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102c4e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c52:	79 12                	jns    102c66 <vprintfmt+0x105>
                width = precision, precision = -1;
  102c54:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102c57:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102c5a:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102c61:	e9 4f ff ff ff       	jmp    102bb5 <vprintfmt+0x54>
  102c66:	e9 4a ff ff ff       	jmp    102bb5 <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102c6b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102c6f:	e9 41 ff ff ff       	jmp    102bb5 <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102c74:	8b 45 14             	mov    0x14(%ebp),%eax
  102c77:	8d 50 04             	lea    0x4(%eax),%edx
  102c7a:	89 55 14             	mov    %edx,0x14(%ebp)
  102c7d:	8b 00                	mov    (%eax),%eax
  102c7f:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c82:	89 54 24 04          	mov    %edx,0x4(%esp)
  102c86:	89 04 24             	mov    %eax,(%esp)
  102c89:	8b 45 08             	mov    0x8(%ebp),%eax
  102c8c:	ff d0                	call   *%eax
            break;
  102c8e:	e9 ac 02 00 00       	jmp    102f3f <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102c93:	8b 45 14             	mov    0x14(%ebp),%eax
  102c96:	8d 50 04             	lea    0x4(%eax),%edx
  102c99:	89 55 14             	mov    %edx,0x14(%ebp)
  102c9c:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102c9e:	85 db                	test   %ebx,%ebx
  102ca0:	79 02                	jns    102ca4 <vprintfmt+0x143>
                err = -err;
  102ca2:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102ca4:	83 fb 06             	cmp    $0x6,%ebx
  102ca7:	7f 0b                	jg     102cb4 <vprintfmt+0x153>
  102ca9:	8b 34 9d 54 3c 10 00 	mov    0x103c54(,%ebx,4),%esi
  102cb0:	85 f6                	test   %esi,%esi
  102cb2:	75 23                	jne    102cd7 <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  102cb4:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102cb8:	c7 44 24 08 81 3c 10 	movl   $0x103c81,0x8(%esp)
  102cbf:	00 
  102cc0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cc3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cc7:	8b 45 08             	mov    0x8(%ebp),%eax
  102cca:	89 04 24             	mov    %eax,(%esp)
  102ccd:	e8 61 fe ff ff       	call   102b33 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102cd2:	e9 68 02 00 00       	jmp    102f3f <vprintfmt+0x3de>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102cd7:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102cdb:	c7 44 24 08 8a 3c 10 	movl   $0x103c8a,0x8(%esp)
  102ce2:	00 
  102ce3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ce6:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cea:	8b 45 08             	mov    0x8(%ebp),%eax
  102ced:	89 04 24             	mov    %eax,(%esp)
  102cf0:	e8 3e fe ff ff       	call   102b33 <printfmt>
            }
            break;
  102cf5:	e9 45 02 00 00       	jmp    102f3f <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102cfa:	8b 45 14             	mov    0x14(%ebp),%eax
  102cfd:	8d 50 04             	lea    0x4(%eax),%edx
  102d00:	89 55 14             	mov    %edx,0x14(%ebp)
  102d03:	8b 30                	mov    (%eax),%esi
  102d05:	85 f6                	test   %esi,%esi
  102d07:	75 05                	jne    102d0e <vprintfmt+0x1ad>
                p = "(null)";
  102d09:	be 8d 3c 10 00       	mov    $0x103c8d,%esi
            }
            if (width > 0 && padc != '-') {
  102d0e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d12:	7e 3e                	jle    102d52 <vprintfmt+0x1f1>
  102d14:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102d18:	74 38                	je     102d52 <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102d1a:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102d1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102d20:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d24:	89 34 24             	mov    %esi,(%esp)
  102d27:	e8 15 03 00 00       	call   103041 <strnlen>
  102d2c:	29 c3                	sub    %eax,%ebx
  102d2e:	89 d8                	mov    %ebx,%eax
  102d30:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102d33:	eb 17                	jmp    102d4c <vprintfmt+0x1eb>
                    putch(padc, putdat);
  102d35:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102d39:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d3c:	89 54 24 04          	mov    %edx,0x4(%esp)
  102d40:	89 04 24             	mov    %eax,(%esp)
  102d43:	8b 45 08             	mov    0x8(%ebp),%eax
  102d46:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102d48:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102d4c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d50:	7f e3                	jg     102d35 <vprintfmt+0x1d4>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102d52:	eb 38                	jmp    102d8c <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102d54:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102d58:	74 1f                	je     102d79 <vprintfmt+0x218>
  102d5a:	83 fb 1f             	cmp    $0x1f,%ebx
  102d5d:	7e 05                	jle    102d64 <vprintfmt+0x203>
  102d5f:	83 fb 7e             	cmp    $0x7e,%ebx
  102d62:	7e 15                	jle    102d79 <vprintfmt+0x218>
                    putch('?', putdat);
  102d64:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d67:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d6b:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102d72:	8b 45 08             	mov    0x8(%ebp),%eax
  102d75:	ff d0                	call   *%eax
  102d77:	eb 0f                	jmp    102d88 <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  102d79:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d7c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d80:	89 1c 24             	mov    %ebx,(%esp)
  102d83:	8b 45 08             	mov    0x8(%ebp),%eax
  102d86:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102d88:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102d8c:	89 f0                	mov    %esi,%eax
  102d8e:	8d 70 01             	lea    0x1(%eax),%esi
  102d91:	0f b6 00             	movzbl (%eax),%eax
  102d94:	0f be d8             	movsbl %al,%ebx
  102d97:	85 db                	test   %ebx,%ebx
  102d99:	74 10                	je     102dab <vprintfmt+0x24a>
  102d9b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102d9f:	78 b3                	js     102d54 <vprintfmt+0x1f3>
  102da1:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102da5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102da9:	79 a9                	jns    102d54 <vprintfmt+0x1f3>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102dab:	eb 17                	jmp    102dc4 <vprintfmt+0x263>
                putch(' ', putdat);
  102dad:	8b 45 0c             	mov    0xc(%ebp),%eax
  102db0:	89 44 24 04          	mov    %eax,0x4(%esp)
  102db4:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102dbb:	8b 45 08             	mov    0x8(%ebp),%eax
  102dbe:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102dc0:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102dc4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102dc8:	7f e3                	jg     102dad <vprintfmt+0x24c>
                putch(' ', putdat);
            }
            break;
  102dca:	e9 70 01 00 00       	jmp    102f3f <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102dcf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102dd2:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dd6:	8d 45 14             	lea    0x14(%ebp),%eax
  102dd9:	89 04 24             	mov    %eax,(%esp)
  102ddc:	e8 0b fd ff ff       	call   102aec <getint>
  102de1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102de4:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102de7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dea:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ded:	85 d2                	test   %edx,%edx
  102def:	79 26                	jns    102e17 <vprintfmt+0x2b6>
                putch('-', putdat);
  102df1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102df4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102df8:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102dff:	8b 45 08             	mov    0x8(%ebp),%eax
  102e02:	ff d0                	call   *%eax
                num = -(long long)num;
  102e04:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e07:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e0a:	f7 d8                	neg    %eax
  102e0c:	83 d2 00             	adc    $0x0,%edx
  102e0f:	f7 da                	neg    %edx
  102e11:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e14:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102e17:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102e1e:	e9 a8 00 00 00       	jmp    102ecb <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102e23:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e26:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e2a:	8d 45 14             	lea    0x14(%ebp),%eax
  102e2d:	89 04 24             	mov    %eax,(%esp)
  102e30:	e8 68 fc ff ff       	call   102a9d <getuint>
  102e35:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e38:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102e3b:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102e42:	e9 84 00 00 00       	jmp    102ecb <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102e47:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e4a:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e4e:	8d 45 14             	lea    0x14(%ebp),%eax
  102e51:	89 04 24             	mov    %eax,(%esp)
  102e54:	e8 44 fc ff ff       	call   102a9d <getuint>
  102e59:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e5c:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102e5f:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102e66:	eb 63                	jmp    102ecb <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  102e68:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e6b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e6f:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102e76:	8b 45 08             	mov    0x8(%ebp),%eax
  102e79:	ff d0                	call   *%eax
            putch('x', putdat);
  102e7b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e7e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e82:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102e89:	8b 45 08             	mov    0x8(%ebp),%eax
  102e8c:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102e8e:	8b 45 14             	mov    0x14(%ebp),%eax
  102e91:	8d 50 04             	lea    0x4(%eax),%edx
  102e94:	89 55 14             	mov    %edx,0x14(%ebp)
  102e97:	8b 00                	mov    (%eax),%eax
  102e99:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e9c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102ea3:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102eaa:	eb 1f                	jmp    102ecb <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102eac:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102eaf:	89 44 24 04          	mov    %eax,0x4(%esp)
  102eb3:	8d 45 14             	lea    0x14(%ebp),%eax
  102eb6:	89 04 24             	mov    %eax,(%esp)
  102eb9:	e8 df fb ff ff       	call   102a9d <getuint>
  102ebe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ec1:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102ec4:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102ecb:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102ecf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ed2:	89 54 24 18          	mov    %edx,0x18(%esp)
  102ed6:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102ed9:	89 54 24 14          	mov    %edx,0x14(%esp)
  102edd:	89 44 24 10          	mov    %eax,0x10(%esp)
  102ee1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ee4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ee7:	89 44 24 08          	mov    %eax,0x8(%esp)
  102eeb:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102eef:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ef2:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ef6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef9:	89 04 24             	mov    %eax,(%esp)
  102efc:	e8 97 fa ff ff       	call   102998 <printnum>
            break;
  102f01:	eb 3c                	jmp    102f3f <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102f03:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f06:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f0a:	89 1c 24             	mov    %ebx,(%esp)
  102f0d:	8b 45 08             	mov    0x8(%ebp),%eax
  102f10:	ff d0                	call   *%eax
            break;
  102f12:	eb 2b                	jmp    102f3f <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102f14:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f17:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f1b:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102f22:	8b 45 08             	mov    0x8(%ebp),%eax
  102f25:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102f27:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102f2b:	eb 04                	jmp    102f31 <vprintfmt+0x3d0>
  102f2d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102f31:	8b 45 10             	mov    0x10(%ebp),%eax
  102f34:	83 e8 01             	sub    $0x1,%eax
  102f37:	0f b6 00             	movzbl (%eax),%eax
  102f3a:	3c 25                	cmp    $0x25,%al
  102f3c:	75 ef                	jne    102f2d <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  102f3e:	90                   	nop
        }
    }
  102f3f:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102f40:	e9 3e fc ff ff       	jmp    102b83 <vprintfmt+0x22>
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  102f45:	83 c4 40             	add    $0x40,%esp
  102f48:	5b                   	pop    %ebx
  102f49:	5e                   	pop    %esi
  102f4a:	5d                   	pop    %ebp
  102f4b:	c3                   	ret    

00102f4c <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102f4c:	55                   	push   %ebp
  102f4d:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102f4f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f52:	8b 40 08             	mov    0x8(%eax),%eax
  102f55:	8d 50 01             	lea    0x1(%eax),%edx
  102f58:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f5b:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102f5e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f61:	8b 10                	mov    (%eax),%edx
  102f63:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f66:	8b 40 04             	mov    0x4(%eax),%eax
  102f69:	39 c2                	cmp    %eax,%edx
  102f6b:	73 12                	jae    102f7f <sprintputch+0x33>
        *b->buf ++ = ch;
  102f6d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f70:	8b 00                	mov    (%eax),%eax
  102f72:	8d 48 01             	lea    0x1(%eax),%ecx
  102f75:	8b 55 0c             	mov    0xc(%ebp),%edx
  102f78:	89 0a                	mov    %ecx,(%edx)
  102f7a:	8b 55 08             	mov    0x8(%ebp),%edx
  102f7d:	88 10                	mov    %dl,(%eax)
    }
}
  102f7f:	5d                   	pop    %ebp
  102f80:	c3                   	ret    

00102f81 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102f81:	55                   	push   %ebp
  102f82:	89 e5                	mov    %esp,%ebp
  102f84:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102f87:	8d 45 14             	lea    0x14(%ebp),%eax
  102f8a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102f8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f90:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f94:	8b 45 10             	mov    0x10(%ebp),%eax
  102f97:	89 44 24 08          	mov    %eax,0x8(%esp)
  102f9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f9e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fa2:	8b 45 08             	mov    0x8(%ebp),%eax
  102fa5:	89 04 24             	mov    %eax,(%esp)
  102fa8:	e8 08 00 00 00       	call   102fb5 <vsnprintf>
  102fad:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102fb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102fb3:	c9                   	leave  
  102fb4:	c3                   	ret    

00102fb5 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102fb5:	55                   	push   %ebp
  102fb6:	89 e5                	mov    %esp,%ebp
  102fb8:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102fbb:	8b 45 08             	mov    0x8(%ebp),%eax
  102fbe:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102fc1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fc4:	8d 50 ff             	lea    -0x1(%eax),%edx
  102fc7:	8b 45 08             	mov    0x8(%ebp),%eax
  102fca:	01 d0                	add    %edx,%eax
  102fcc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fcf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102fd6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102fda:	74 0a                	je     102fe6 <vsnprintf+0x31>
  102fdc:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102fdf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fe2:	39 c2                	cmp    %eax,%edx
  102fe4:	76 07                	jbe    102fed <vsnprintf+0x38>
        return -E_INVAL;
  102fe6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102feb:	eb 2a                	jmp    103017 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102fed:	8b 45 14             	mov    0x14(%ebp),%eax
  102ff0:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102ff4:	8b 45 10             	mov    0x10(%ebp),%eax
  102ff7:	89 44 24 08          	mov    %eax,0x8(%esp)
  102ffb:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102ffe:	89 44 24 04          	mov    %eax,0x4(%esp)
  103002:	c7 04 24 4c 2f 10 00 	movl   $0x102f4c,(%esp)
  103009:	e8 53 fb ff ff       	call   102b61 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  10300e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103011:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103014:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103017:	c9                   	leave  
  103018:	c3                   	ret    

00103019 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  103019:	55                   	push   %ebp
  10301a:	89 e5                	mov    %esp,%ebp
  10301c:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10301f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  103026:	eb 04                	jmp    10302c <strlen+0x13>
        cnt ++;
  103028:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  10302c:	8b 45 08             	mov    0x8(%ebp),%eax
  10302f:	8d 50 01             	lea    0x1(%eax),%edx
  103032:	89 55 08             	mov    %edx,0x8(%ebp)
  103035:	0f b6 00             	movzbl (%eax),%eax
  103038:	84 c0                	test   %al,%al
  10303a:	75 ec                	jne    103028 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  10303c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10303f:	c9                   	leave  
  103040:	c3                   	ret    

00103041 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  103041:	55                   	push   %ebp
  103042:	89 e5                	mov    %esp,%ebp
  103044:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  103047:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  10304e:	eb 04                	jmp    103054 <strnlen+0x13>
        cnt ++;
  103050:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  103054:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103057:	3b 45 0c             	cmp    0xc(%ebp),%eax
  10305a:	73 10                	jae    10306c <strnlen+0x2b>
  10305c:	8b 45 08             	mov    0x8(%ebp),%eax
  10305f:	8d 50 01             	lea    0x1(%eax),%edx
  103062:	89 55 08             	mov    %edx,0x8(%ebp)
  103065:	0f b6 00             	movzbl (%eax),%eax
  103068:	84 c0                	test   %al,%al
  10306a:	75 e4                	jne    103050 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  10306c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10306f:	c9                   	leave  
  103070:	c3                   	ret    

00103071 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  103071:	55                   	push   %ebp
  103072:	89 e5                	mov    %esp,%ebp
  103074:	57                   	push   %edi
  103075:	56                   	push   %esi
  103076:	83 ec 20             	sub    $0x20,%esp
  103079:	8b 45 08             	mov    0x8(%ebp),%eax
  10307c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10307f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103082:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  103085:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103088:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10308b:	89 d1                	mov    %edx,%ecx
  10308d:	89 c2                	mov    %eax,%edx
  10308f:	89 ce                	mov    %ecx,%esi
  103091:	89 d7                	mov    %edx,%edi
  103093:	ac                   	lods   %ds:(%esi),%al
  103094:	aa                   	stos   %al,%es:(%edi)
  103095:	84 c0                	test   %al,%al
  103097:	75 fa                	jne    103093 <strcpy+0x22>
  103099:	89 fa                	mov    %edi,%edx
  10309b:	89 f1                	mov    %esi,%ecx
  10309d:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  1030a0:	89 55 e8             	mov    %edx,-0x18(%ebp)
  1030a3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  1030a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  1030a9:	83 c4 20             	add    $0x20,%esp
  1030ac:	5e                   	pop    %esi
  1030ad:	5f                   	pop    %edi
  1030ae:	5d                   	pop    %ebp
  1030af:	c3                   	ret    

001030b0 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  1030b0:	55                   	push   %ebp
  1030b1:	89 e5                	mov    %esp,%ebp
  1030b3:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  1030b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  1030bc:	eb 21                	jmp    1030df <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  1030be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030c1:	0f b6 10             	movzbl (%eax),%edx
  1030c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030c7:	88 10                	mov    %dl,(%eax)
  1030c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030cc:	0f b6 00             	movzbl (%eax),%eax
  1030cf:	84 c0                	test   %al,%al
  1030d1:	74 04                	je     1030d7 <strncpy+0x27>
            src ++;
  1030d3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  1030d7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1030db:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  1030df:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1030e3:	75 d9                	jne    1030be <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  1030e5:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1030e8:	c9                   	leave  
  1030e9:	c3                   	ret    

001030ea <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  1030ea:	55                   	push   %ebp
  1030eb:	89 e5                	mov    %esp,%ebp
  1030ed:	57                   	push   %edi
  1030ee:	56                   	push   %esi
  1030ef:	83 ec 20             	sub    $0x20,%esp
  1030f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  1030fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103101:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103104:	89 d1                	mov    %edx,%ecx
  103106:	89 c2                	mov    %eax,%edx
  103108:	89 ce                	mov    %ecx,%esi
  10310a:	89 d7                	mov    %edx,%edi
  10310c:	ac                   	lods   %ds:(%esi),%al
  10310d:	ae                   	scas   %es:(%edi),%al
  10310e:	75 08                	jne    103118 <strcmp+0x2e>
  103110:	84 c0                	test   %al,%al
  103112:	75 f8                	jne    10310c <strcmp+0x22>
  103114:	31 c0                	xor    %eax,%eax
  103116:	eb 04                	jmp    10311c <strcmp+0x32>
  103118:	19 c0                	sbb    %eax,%eax
  10311a:	0c 01                	or     $0x1,%al
  10311c:	89 fa                	mov    %edi,%edx
  10311e:	89 f1                	mov    %esi,%ecx
  103120:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103123:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103126:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  103129:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  10312c:	83 c4 20             	add    $0x20,%esp
  10312f:	5e                   	pop    %esi
  103130:	5f                   	pop    %edi
  103131:	5d                   	pop    %ebp
  103132:	c3                   	ret    

00103133 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  103133:	55                   	push   %ebp
  103134:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103136:	eb 0c                	jmp    103144 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  103138:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10313c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103140:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103144:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103148:	74 1a                	je     103164 <strncmp+0x31>
  10314a:	8b 45 08             	mov    0x8(%ebp),%eax
  10314d:	0f b6 00             	movzbl (%eax),%eax
  103150:	84 c0                	test   %al,%al
  103152:	74 10                	je     103164 <strncmp+0x31>
  103154:	8b 45 08             	mov    0x8(%ebp),%eax
  103157:	0f b6 10             	movzbl (%eax),%edx
  10315a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10315d:	0f b6 00             	movzbl (%eax),%eax
  103160:	38 c2                	cmp    %al,%dl
  103162:	74 d4                	je     103138 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  103164:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103168:	74 18                	je     103182 <strncmp+0x4f>
  10316a:	8b 45 08             	mov    0x8(%ebp),%eax
  10316d:	0f b6 00             	movzbl (%eax),%eax
  103170:	0f b6 d0             	movzbl %al,%edx
  103173:	8b 45 0c             	mov    0xc(%ebp),%eax
  103176:	0f b6 00             	movzbl (%eax),%eax
  103179:	0f b6 c0             	movzbl %al,%eax
  10317c:	29 c2                	sub    %eax,%edx
  10317e:	89 d0                	mov    %edx,%eax
  103180:	eb 05                	jmp    103187 <strncmp+0x54>
  103182:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103187:	5d                   	pop    %ebp
  103188:	c3                   	ret    

00103189 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  103189:	55                   	push   %ebp
  10318a:	89 e5                	mov    %esp,%ebp
  10318c:	83 ec 04             	sub    $0x4,%esp
  10318f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103192:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  103195:	eb 14                	jmp    1031ab <strchr+0x22>
        if (*s == c) {
  103197:	8b 45 08             	mov    0x8(%ebp),%eax
  10319a:	0f b6 00             	movzbl (%eax),%eax
  10319d:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1031a0:	75 05                	jne    1031a7 <strchr+0x1e>
            return (char *)s;
  1031a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1031a5:	eb 13                	jmp    1031ba <strchr+0x31>
        }
        s ++;
  1031a7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  1031ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ae:	0f b6 00             	movzbl (%eax),%eax
  1031b1:	84 c0                	test   %al,%al
  1031b3:	75 e2                	jne    103197 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  1031b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1031ba:	c9                   	leave  
  1031bb:	c3                   	ret    

001031bc <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  1031bc:	55                   	push   %ebp
  1031bd:	89 e5                	mov    %esp,%ebp
  1031bf:	83 ec 04             	sub    $0x4,%esp
  1031c2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031c5:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1031c8:	eb 11                	jmp    1031db <strfind+0x1f>
        if (*s == c) {
  1031ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1031cd:	0f b6 00             	movzbl (%eax),%eax
  1031d0:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1031d3:	75 02                	jne    1031d7 <strfind+0x1b>
            break;
  1031d5:	eb 0e                	jmp    1031e5 <strfind+0x29>
        }
        s ++;
  1031d7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  1031db:	8b 45 08             	mov    0x8(%ebp),%eax
  1031de:	0f b6 00             	movzbl (%eax),%eax
  1031e1:	84 c0                	test   %al,%al
  1031e3:	75 e5                	jne    1031ca <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  1031e5:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1031e8:	c9                   	leave  
  1031e9:	c3                   	ret    

001031ea <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  1031ea:	55                   	push   %ebp
  1031eb:	89 e5                	mov    %esp,%ebp
  1031ed:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  1031f0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  1031f7:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  1031fe:	eb 04                	jmp    103204 <strtol+0x1a>
        s ++;
  103200:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103204:	8b 45 08             	mov    0x8(%ebp),%eax
  103207:	0f b6 00             	movzbl (%eax),%eax
  10320a:	3c 20                	cmp    $0x20,%al
  10320c:	74 f2                	je     103200 <strtol+0x16>
  10320e:	8b 45 08             	mov    0x8(%ebp),%eax
  103211:	0f b6 00             	movzbl (%eax),%eax
  103214:	3c 09                	cmp    $0x9,%al
  103216:	74 e8                	je     103200 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  103218:	8b 45 08             	mov    0x8(%ebp),%eax
  10321b:	0f b6 00             	movzbl (%eax),%eax
  10321e:	3c 2b                	cmp    $0x2b,%al
  103220:	75 06                	jne    103228 <strtol+0x3e>
        s ++;
  103222:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103226:	eb 15                	jmp    10323d <strtol+0x53>
    }
    else if (*s == '-') {
  103228:	8b 45 08             	mov    0x8(%ebp),%eax
  10322b:	0f b6 00             	movzbl (%eax),%eax
  10322e:	3c 2d                	cmp    $0x2d,%al
  103230:	75 0b                	jne    10323d <strtol+0x53>
        s ++, neg = 1;
  103232:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103236:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10323d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103241:	74 06                	je     103249 <strtol+0x5f>
  103243:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103247:	75 24                	jne    10326d <strtol+0x83>
  103249:	8b 45 08             	mov    0x8(%ebp),%eax
  10324c:	0f b6 00             	movzbl (%eax),%eax
  10324f:	3c 30                	cmp    $0x30,%al
  103251:	75 1a                	jne    10326d <strtol+0x83>
  103253:	8b 45 08             	mov    0x8(%ebp),%eax
  103256:	83 c0 01             	add    $0x1,%eax
  103259:	0f b6 00             	movzbl (%eax),%eax
  10325c:	3c 78                	cmp    $0x78,%al
  10325e:	75 0d                	jne    10326d <strtol+0x83>
        s += 2, base = 16;
  103260:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103264:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  10326b:	eb 2a                	jmp    103297 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  10326d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103271:	75 17                	jne    10328a <strtol+0xa0>
  103273:	8b 45 08             	mov    0x8(%ebp),%eax
  103276:	0f b6 00             	movzbl (%eax),%eax
  103279:	3c 30                	cmp    $0x30,%al
  10327b:	75 0d                	jne    10328a <strtol+0xa0>
        s ++, base = 8;
  10327d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103281:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103288:	eb 0d                	jmp    103297 <strtol+0xad>
    }
    else if (base == 0) {
  10328a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10328e:	75 07                	jne    103297 <strtol+0xad>
        base = 10;
  103290:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  103297:	8b 45 08             	mov    0x8(%ebp),%eax
  10329a:	0f b6 00             	movzbl (%eax),%eax
  10329d:	3c 2f                	cmp    $0x2f,%al
  10329f:	7e 1b                	jle    1032bc <strtol+0xd2>
  1032a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a4:	0f b6 00             	movzbl (%eax),%eax
  1032a7:	3c 39                	cmp    $0x39,%al
  1032a9:	7f 11                	jg     1032bc <strtol+0xd2>
            dig = *s - '0';
  1032ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ae:	0f b6 00             	movzbl (%eax),%eax
  1032b1:	0f be c0             	movsbl %al,%eax
  1032b4:	83 e8 30             	sub    $0x30,%eax
  1032b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1032ba:	eb 48                	jmp    103304 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1032bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1032bf:	0f b6 00             	movzbl (%eax),%eax
  1032c2:	3c 60                	cmp    $0x60,%al
  1032c4:	7e 1b                	jle    1032e1 <strtol+0xf7>
  1032c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c9:	0f b6 00             	movzbl (%eax),%eax
  1032cc:	3c 7a                	cmp    $0x7a,%al
  1032ce:	7f 11                	jg     1032e1 <strtol+0xf7>
            dig = *s - 'a' + 10;
  1032d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1032d3:	0f b6 00             	movzbl (%eax),%eax
  1032d6:	0f be c0             	movsbl %al,%eax
  1032d9:	83 e8 57             	sub    $0x57,%eax
  1032dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1032df:	eb 23                	jmp    103304 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  1032e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1032e4:	0f b6 00             	movzbl (%eax),%eax
  1032e7:	3c 40                	cmp    $0x40,%al
  1032e9:	7e 3d                	jle    103328 <strtol+0x13e>
  1032eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ee:	0f b6 00             	movzbl (%eax),%eax
  1032f1:	3c 5a                	cmp    $0x5a,%al
  1032f3:	7f 33                	jg     103328 <strtol+0x13e>
            dig = *s - 'A' + 10;
  1032f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f8:	0f b6 00             	movzbl (%eax),%eax
  1032fb:	0f be c0             	movsbl %al,%eax
  1032fe:	83 e8 37             	sub    $0x37,%eax
  103301:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103304:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103307:	3b 45 10             	cmp    0x10(%ebp),%eax
  10330a:	7c 02                	jl     10330e <strtol+0x124>
            break;
  10330c:	eb 1a                	jmp    103328 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  10330e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103312:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103315:	0f af 45 10          	imul   0x10(%ebp),%eax
  103319:	89 c2                	mov    %eax,%edx
  10331b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10331e:	01 d0                	add    %edx,%eax
  103320:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  103323:	e9 6f ff ff ff       	jmp    103297 <strtol+0xad>

    if (endptr) {
  103328:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10332c:	74 08                	je     103336 <strtol+0x14c>
        *endptr = (char *) s;
  10332e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103331:	8b 55 08             	mov    0x8(%ebp),%edx
  103334:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103336:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  10333a:	74 07                	je     103343 <strtol+0x159>
  10333c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10333f:	f7 d8                	neg    %eax
  103341:	eb 03                	jmp    103346 <strtol+0x15c>
  103343:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103346:	c9                   	leave  
  103347:	c3                   	ret    

00103348 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103348:	55                   	push   %ebp
  103349:	89 e5                	mov    %esp,%ebp
  10334b:	57                   	push   %edi
  10334c:	83 ec 24             	sub    $0x24,%esp
  10334f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103352:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103355:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  103359:	8b 55 08             	mov    0x8(%ebp),%edx
  10335c:	89 55 f8             	mov    %edx,-0x8(%ebp)
  10335f:	88 45 f7             	mov    %al,-0x9(%ebp)
  103362:	8b 45 10             	mov    0x10(%ebp),%eax
  103365:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103368:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  10336b:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10336f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103372:	89 d7                	mov    %edx,%edi
  103374:	f3 aa                	rep stos %al,%es:(%edi)
  103376:	89 fa                	mov    %edi,%edx
  103378:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10337b:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  10337e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  103381:	83 c4 24             	add    $0x24,%esp
  103384:	5f                   	pop    %edi
  103385:	5d                   	pop    %ebp
  103386:	c3                   	ret    

00103387 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103387:	55                   	push   %ebp
  103388:	89 e5                	mov    %esp,%ebp
  10338a:	57                   	push   %edi
  10338b:	56                   	push   %esi
  10338c:	53                   	push   %ebx
  10338d:	83 ec 30             	sub    $0x30,%esp
  103390:	8b 45 08             	mov    0x8(%ebp),%eax
  103393:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103396:	8b 45 0c             	mov    0xc(%ebp),%eax
  103399:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10339c:	8b 45 10             	mov    0x10(%ebp),%eax
  10339f:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  1033a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033a5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1033a8:	73 42                	jae    1033ec <memmove+0x65>
  1033aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1033b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1033b3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1033b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033b9:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1033bc:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1033bf:	c1 e8 02             	shr    $0x2,%eax
  1033c2:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1033c4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1033c7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033ca:	89 d7                	mov    %edx,%edi
  1033cc:	89 c6                	mov    %eax,%esi
  1033ce:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1033d0:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1033d3:	83 e1 03             	and    $0x3,%ecx
  1033d6:	74 02                	je     1033da <memmove+0x53>
  1033d8:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1033da:	89 f0                	mov    %esi,%eax
  1033dc:	89 fa                	mov    %edi,%edx
  1033de:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1033e1:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  1033e4:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  1033e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1033ea:	eb 36                	jmp    103422 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1033ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033ef:	8d 50 ff             	lea    -0x1(%eax),%edx
  1033f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1033f5:	01 c2                	add    %eax,%edx
  1033f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1033fa:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1033fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103400:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  103403:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103406:	89 c1                	mov    %eax,%ecx
  103408:	89 d8                	mov    %ebx,%eax
  10340a:	89 d6                	mov    %edx,%esi
  10340c:	89 c7                	mov    %eax,%edi
  10340e:	fd                   	std    
  10340f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103411:	fc                   	cld    
  103412:	89 f8                	mov    %edi,%eax
  103414:	89 f2                	mov    %esi,%edx
  103416:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103419:	89 55 c8             	mov    %edx,-0x38(%ebp)
  10341c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  10341f:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103422:	83 c4 30             	add    $0x30,%esp
  103425:	5b                   	pop    %ebx
  103426:	5e                   	pop    %esi
  103427:	5f                   	pop    %edi
  103428:	5d                   	pop    %ebp
  103429:	c3                   	ret    

0010342a <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10342a:	55                   	push   %ebp
  10342b:	89 e5                	mov    %esp,%ebp
  10342d:	57                   	push   %edi
  10342e:	56                   	push   %esi
  10342f:	83 ec 20             	sub    $0x20,%esp
  103432:	8b 45 08             	mov    0x8(%ebp),%eax
  103435:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103438:	8b 45 0c             	mov    0xc(%ebp),%eax
  10343b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10343e:	8b 45 10             	mov    0x10(%ebp),%eax
  103441:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103444:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103447:	c1 e8 02             	shr    $0x2,%eax
  10344a:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  10344c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10344f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103452:	89 d7                	mov    %edx,%edi
  103454:	89 c6                	mov    %eax,%esi
  103456:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103458:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10345b:	83 e1 03             	and    $0x3,%ecx
  10345e:	74 02                	je     103462 <memcpy+0x38>
  103460:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103462:	89 f0                	mov    %esi,%eax
  103464:	89 fa                	mov    %edi,%edx
  103466:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103469:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10346c:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  10346f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103472:	83 c4 20             	add    $0x20,%esp
  103475:	5e                   	pop    %esi
  103476:	5f                   	pop    %edi
  103477:	5d                   	pop    %ebp
  103478:	c3                   	ret    

00103479 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103479:	55                   	push   %ebp
  10347a:	89 e5                	mov    %esp,%ebp
  10347c:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  10347f:	8b 45 08             	mov    0x8(%ebp),%eax
  103482:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103485:	8b 45 0c             	mov    0xc(%ebp),%eax
  103488:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  10348b:	eb 30                	jmp    1034bd <memcmp+0x44>
        if (*s1 != *s2) {
  10348d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103490:	0f b6 10             	movzbl (%eax),%edx
  103493:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103496:	0f b6 00             	movzbl (%eax),%eax
  103499:	38 c2                	cmp    %al,%dl
  10349b:	74 18                	je     1034b5 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  10349d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1034a0:	0f b6 00             	movzbl (%eax),%eax
  1034a3:	0f b6 d0             	movzbl %al,%edx
  1034a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1034a9:	0f b6 00             	movzbl (%eax),%eax
  1034ac:	0f b6 c0             	movzbl %al,%eax
  1034af:	29 c2                	sub    %eax,%edx
  1034b1:	89 d0                	mov    %edx,%eax
  1034b3:	eb 1a                	jmp    1034cf <memcmp+0x56>
        }
        s1 ++, s2 ++;
  1034b5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1034b9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  1034bd:	8b 45 10             	mov    0x10(%ebp),%eax
  1034c0:	8d 50 ff             	lea    -0x1(%eax),%edx
  1034c3:	89 55 10             	mov    %edx,0x10(%ebp)
  1034c6:	85 c0                	test   %eax,%eax
  1034c8:	75 c3                	jne    10348d <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  1034ca:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1034cf:	c9                   	leave  
  1034d0:	c3                   	ret    
