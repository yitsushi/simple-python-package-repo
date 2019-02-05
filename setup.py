from setuptools import find_packages, setup
from sppr import __version__


setup(
    name='sppr',
    version=__version__,
    author="Balazs Nadasdi",
    author_email="balazs.nadasdi@cheppers.com",
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        'flask',
        'requests'
    ],
)

