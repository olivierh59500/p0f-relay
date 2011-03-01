# Copyright (C) 2011 Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

srcdir = .
top_srcdir = .

CC ?= gcc
CFLAGS ?= -Wall -W -g3 -O1
LDFLAGS ?= -Wl,--as-needed

AM_CFLAGS = -std=gnu99
AM_CPPFLAGS = \
	-I $(top_srcdir)/include \
	-D VERSION=\"$(VERSION)\" \
	-D _GNU_SOURCE \
	-D LOCALSTATEDIR=\"$(localstatedir)\"

sbin_PROGRAMS = \
	p0f-dispatcher \
	p0f-server

p0f-dispatcher_SOURCES = \
	dispatcher/main.c \
	lib/daemonize.c

p0f-server_SOURCES = \
	server/main.c \
	lib/daemonize.c

all:	_all
clean:	_clean

include common.mk