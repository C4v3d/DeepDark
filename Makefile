CC = gcc
FLAGS = -Wall -Werror -Wextra `sdl2-config --libs --cflags` -ggdb3 -O0 --std=c99 -lSDL2_image -lm
BUILD_PATH = build

CFILES_PATH = src
CFILES = $(CFILES_PATH)/main.c \

OBJ = $(CFILES:$(CFILES_PATH)/%.c=$(BUILD_PATH)/%.o)

NAME = DeepDark

all:
	$(MAKE) $(NAME)

$(NAME): $(OBJ)
	$(CC) $(OBJ) -o $(NAME)

$(BUILD_PATH)/%.o: $(CFILES_PATH)/%.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean :
	rm -rf $(BUILD_PATH)/*.o

fclean : clean
	rm -f $(NAME)
	rm -rf $(BUILD_PATH)

re: fclean all

.PHONY: all clean fclean re
