import arrow
import pathlib
import subprocess
import time

from countdown import Countdown

MAKO_DIR = pathlib.Path('templates/')
BUILD_DIR = pathlib.Path('build/')

def main():
    subprocess.Popen(['pixlet', 'serve', 'build/display.star', '--watch'],
        shell=False, stdin=None, stdout=None, stderr=None, close_fds=False)
    print('here')
    disp = [
        Countdown(
            arrow.get('2022-05-15 10:00:00'),
            'AP Physics Exam',
            MAKO_DIR / 'countdown.star.mako',
            BUILD_DIR / 'display.star')
    ]

    while True:
        disp[0].render()

        time.sleep(60)

if __name__ == '__main__':
    main()